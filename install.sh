#!/bin/bash

# ===================================================
#   AmirTunnel Pro Installer - Ultimate Version
#   Created for Community
# ===================================================

# --- Configuration ---
VERSION="1.0.0"
GITHUB_USER="KimiVerse"
GITHUB_REPO="evilcu_proj"
BRANCH="main"
SCRIPT_URL="https://raw.githubusercontent.com/$GITHUB_USER/$GITHUB_REPO/$BRANCH/install.sh"

# --- Paths ---
BIN_PATH="/usr/local/bin/AmirTunnel.bin"
SHORTCUT_PATH="/usr/local/bin/amirtunnel"
SERVICE_PATH="/etc/systemd/system/AmirTunnel.bin.service"
DOWNLOAD_URL="https://github.com/amircpuir/AmirTunnel-Pro/releases/download/v2.0.0/AmirTunnel.bin"

# --- Colors ---
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m' # No Color

# --- Helper Functions ---

check_root() {
    if [[ $EUID -ne 0 ]]; then
       echo -e "${RED}${BOLD}[✘] Please run this script as root!${NC}" 
       exit 1
    fi
}

draw_line() {
    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
}

show_logo() {
    clear
    echo -e "${CYAN}${BOLD}"
    echo "    _    __  __ ___ ____  _____                          _ "
    echo "   / \  |  \/  |_ _|  _ \|_   _|   _ _ __  _ __   ___| |"
    echo "  / _ \ | |\/| || || |_) | | || | | | '_ \| '_ \ / _ \ |"
    echo " / ___ \| |  | || ||  _ <  | || |_| | | | | | | |  __/ |"
    echo "/_/   \_\_|  |_|___|_| \_\ |_| \__,_|_| |_|_| |_|\___|_|"
    echo -e "${PURPLE}           :: AmirTunnel Pro Installer ::           ${NC}"
    echo -e "${YELLOW}           ::    Version: $VERSION    ::           ${NC}"
    draw_line
}

loading_bar() {
    local duration=${1}
    echo -ne "${GREEN}Processing: ["
    for ((i=0; i<20; i++)); do
        echo -ne "▓"
        sleep $(awk "BEGIN {print $duration / 20}")
    done
    echo -e "] Done!${NC}"
}

install_deps() {
    echo -e "${CYAN}[+] Installing dependencies...${NC}"
    apt-get update -qq >/dev/null 2>&1
    apt-get install -y wget nano curl socat -qq >/dev/null 2>&1
}

download_core() {
    echo -e "${CYAN}[+] Downloading Core Binary...${NC}"
    if wget -q -O "$BIN_PATH" "$DOWNLOAD_URL"; then
        chmod +x "$BIN_PATH"
        echo -e "${GREEN}[✔] Core installed successfully.${NC}"
    else
        echo -e "${RED}[✘] Download failed!${NC}"
        exit 1
    fi
}

setup_service() {
    echo -e "${CYAN}[+] Configuring Systemd Service...${NC}"
    systemctl daemon-reload
    systemctl enable AmirTunnel.bin.service >/dev/null 2>&1
    systemctl restart AmirTunnel.bin.service
    loading_bar 1
    echo -e "${GREEN}[✔] Service Started!${NC}"
    read -p "Press Enter to return..."
}

# --- Actions ---

create_shortcut() {
    echo -e "${CYAN}[+] Creating 'amirtunnel' shortcut...${NC}"
    # Download the script itself to /usr/local/bin
    if wget -q -O "$SHORTCUT_PATH" "$SCRIPT_URL"; then
        chmod +x "$SHORTCUT_PATH"
        echo -e "${GREEN}[✔] Shortcut created successfully!${NC}"
        echo -e "${YELLOW}[!] From now on, just type '${BOLD}amirtunnel${NC}${YELLOW}' to open this menu.${NC}"
    else
        echo -e "${RED}[✘] Failed to download script from GitHub.${NC}"
    fi
    sleep 3
}

install_kharej() {
    install_deps
    download_core
    
    echo ""
    read -e -p "Enter Iran Server IP: " iran_ip
    [[ -z "$iran_ip" ]] && { echo -e "${RED}IP Required!${NC}"; sleep 1; return; }
    
    read -e -p "Enter Bridge Port [Default: 4444]: " -i "4444" bridge_port
    read -e -p "Enter Sync Port [Default: 5555]: " -i "5555" sync_port

    cat <<EOF > $SERVICE_PATH
[Unit]
Description=AmirTunnel.bin Pro Service (Europe)
After=network.target
[Service]
Type=simple
User=root
Environment="RUN_MODE=EUROPE"
Environment="IRAN_IP=$iran_ip" 
Environment="BRIDGE_PORT=$bridge_port"
Environment="SYNC_PORT=$sync_port"
ExecStart=$BIN_PATH
Restart=always
RestartSec=3
LimitNOFILE=1000000
[Install]
WantedBy=multi-user.target
EOF
    setup_service
}

install_iran() {
    install_deps
    download_core

    echo ""
    read -e -p "Enter Bridge Port [Default: 4444]: " -i "4444" bridge_port
    read -e -p "Enter Sync Port [Default: 5555]: " -i "5555" sync_port

    echo -e "${YELLOW}Auto Xray Sync?${NC}"
    echo "1) Yes (Auto)"
    echo "2) No (Manual)"
    read -p "Select [1-2]: " pmode

    if [[ "$pmode" == "1" ]]; then
        is_auto="True"; manual_ports=""
    else
        is_auto="False"
        read -p "Enter Ports (e.g. 80,443): " manual_ports
    fi

    cat <<EOF > $SERVICE_PATH
[Unit]
Description=AmirTunnel.bin Pro Service (Iran)
After=network.target
[Service]
Type=simple
User=root
Environment="RUN_MODE=IRAN"
Environment="BRIDGE_PORT=$bridge_port"
Environment="SYNC_PORT=$sync_port"
Environment="IS_AUTO=$is_auto"
Environment="MANUAL_PORTS=$manual_ports"
ExecStart=$BIN_PATH
Restart=always
RestartSec=3
LimitNOFILE=1000000
[Install]
WantedBy=multi-user.target
EOF
    setup_service
}

enable_bbr() {
    echo -e "${CYAN}[+] Enabling BBR...${NC}"
    if ! grep -q "bbr" /etc/sysctl.conf; then
        echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf
        echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf
        sysctl -p
    fi
    echo -e "${GREEN}[✔] BBR Enabled.${NC}"
    sleep 2
}

uninstall() {
    echo -e "${RED}${BOLD}[!] DANGER: This will remove AmirTunnel & Shortcuts.${NC}"
    read -p "Are you sure? (y/n): " confirm
    if [[ "$confirm" =~ ^[Yy]$ ]]; then
        echo -e "${YELLOW}Stopping services...${NC}"
        systemctl stop AmirTunnel.bin.service
        systemctl disable AmirTunnel.bin.service
        
        echo -e "${YELLOW}Removing files...${NC}"
        rm -f $SERVICE_PATH
        rm -f $BIN_PATH
        rm -f $SHORTCUT_PATH
        
        systemctl daemon-reload
        echo -e "${GREEN}[✔] Uninstallation complete.${NC}"
    else
        echo -e "${YELLOW}Cancelled.${NC}"
    fi
    sleep 2
}

# --- Main Menu ---

main_menu() {
    while true; do
        show_logo
        echo -e "${GREEN} 1) ${NC} Install - Europe (Kharej)"
        echo -e "${GREEN} 2) ${NC} Install - Iran"
        draw_line
        echo -e "${CYAN} 3) ${NC} Restart Service"
        echo -e "${CYAN} 4) ${NC} Stop Service"
        echo -e "${CYAN} 5) ${NC} Check Status"
        echo -e "${CYAN} 6) ${NC} Live Logs"
        echo -e "${CYAN} 7) ${NC} Edit Config"
        draw_line
        echo -e "${PURPLE} 8) ${NC} Enable BBR"
        echo -e "${PURPLE} 9) ${NC} Create Shortcut command ('amirtunnel')"
        echo -e "${RED} 0) ${NC} Uninstall Completely"
        echo -e "${RED} q) ${NC} Exit Menu"
        echo ""
        read -p "Select Option: " choice

        case $choice in
            1) install_kharej ;;
            2) install_iran ;;
            3) systemctl restart AmirTunnel.bin.service; echo -e "${GREEN}Restarted!${NC}"; sleep 1 ;;
            4) systemctl stop AmirTunnel.bin.service; echo -e "${RED}Stopped!${NC}"; sleep 1 ;;
            5) systemctl status AmirTunnel.bin.service; read -p "Enter..." ;;
            6) journalctl -u AmirTunnel.bin.service -f -n 50 ;;
            7) nano $SERVICE_PATH && systemctl daemon-reload && systemctl restart AmirTunnel.bin.service ;;
            8) enable_bbr ;;
            9) create_shortcut ;;
            0) uninstall ;;
            q) exit 0 ;;
            *) echo -e "${RED}Invalid!${NC}"; sleep 1 ;;
        esac
    done
}

check_root
main_menu