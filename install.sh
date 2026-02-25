#!/bin/bash

# ===================================================
#   AmirTunnel Pro Installer - Advanced Shell Script
#   Created for Community
# ===================================================

# --- Colors & Styles ---
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m' # No Color

# --- Variables ---
BIN_PATH="/usr/local/bin/AmirTunnel.bin"
SERVICE_PATH="/etc/systemd/system/AmirTunnel.bin.service"
DOWNLOAD_URL="https://github.com/amircpuir/AmirTunnel-Pro/releases/download/v2.0.0/AmirTunnel.bin"
VERSION="2.0.0"

# --- Helper Functions ---

check_root() {
    if [[ $EUID -ne 0 ]]; then
       echo -e "${RED}${BOLD}[✘] This script must be run as root!${NC}" 
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
    local bars="####################"
    echo -ne "${GREEN}Processing: ["
    for ((i=0; i<20; i++)); do
        echo -ne "#"
        sleep $(awk "BEGIN {print $duration / 20}")
    done
    echo -e "] Done!${NC}"
}

install_deps() {
    echo -e "${CYAN}[+] Updating system and installing dependencies...${NC}"
    apt-get update -qq >/dev/null 2>&1
    apt-get install -y wget nano curl socat -qq >/dev/null 2>&1
    loading_bar 2
}

download_core() {
    echo -e "${CYAN}[+] Downloading Core Binary...${NC}"
    if wget -q -O "$BIN_PATH" "$DOWNLOAD_URL"; then
        chmod +x "$BIN_PATH"
        echo -e "${GREEN}[✔] Core installed successfully.${NC}"
    else
        echo -e "${RED}[✘] Download failed. Check internet connection.${NC}"
        exit 1
    fi
}

setup_service() {
    local mode=$1
    echo -e "${CYAN}[+] Configuring Systemd Service...${NC}"
    
    # Reload daemon and enable
    systemctl daemon-reload
    systemctl enable AmirTunnel.bin.service >/dev/null 2>&1
    systemctl restart AmirTunnel.bin.service
    
    loading_bar 1
    echo -e "${GREEN}[✔] Service Started Successfully!${NC}"
    echo -e "${YELLOW}[!] Use Option 5 to check status.${NC}"
    read -p "Press Enter to return to menu..."
}

# --- Install Functions ---

install_kharej() {
    show_logo
    echo -e "${BOLD}:: INSTALLATION > FOREIGN SERVER (KHAREJ) ::${NC}"
    echo ""
    
    install_deps
    download_core

    read -e -p "Enter Iran Server IP: " iran_ip
    if [[ -z "$iran_ip" ]]; then
        echo -e "${RED}[✘] IP cannot be empty!${NC}"
        sleep 2
        return
    fi

    read -e -p "Enter Bridge Port [Default: 4444]: " -i "4444" bridge_port
    read -e -p "Enter Sync Port [Default: 5555]: " -i "5555" sync_port

    cat <<EOF > $SERVICE_PATH
[Unit]
Description=AmirTunnel.bin Pro Service (Europe)
After=network.target

[Service]
Type=simple
User=root
WorkingDirectory=/root
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
    
    setup_service "EUROPE"
}

install_iran() {
    show_logo
    echo -e "${BOLD}:: INSTALLATION > IRAN SERVER ::${NC}"
    echo ""
    
    install_deps
    download_core

    read -e -p "Enter Bridge Port [Default: 4444]: " -i "4444" bridge_port
    read -e -p "Enter Sync Port [Default: 5555]: " -i "5555" sync_port

    echo ""
    echo -e "${YELLOW}Do you want Auto Xray Sync?${NC}"
    echo "1) Yes (Auto find ports)"
    echo "2) No (Manual define ports)"
    read -p "Select [1-2]: " port_mode

    if [[ "$port_mode" == "1" ]]; then
        is_auto="True"
        manual_ports=""
    else
        is_auto="False"
        read -p "Enter Ports to Tunnel (comma separated e.g. 80,443): " manual_ports
    fi

    cat <<EOF > $SERVICE_PATH
[Unit]
Description=AmirTunnel.bin Pro Service (Iran)
After=network.target

[Service]
Type=simple
User=root
WorkingDirectory=/root
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

    setup_service "IRAN"
}

# --- Management Functions ---

enable_bbr() {
    echo -e "${CYAN}[+] Enabling TCP BBR...${NC}"
    if grep -q "bbr" /etc/sysctl.conf; then
        echo -e "${GREEN}[✔] BBR is already enabled.${NC}"
    else
        echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf
        echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf
        sysctl -p
        echo -e "${GREEN}[✔] BBR Enabled Successfully.${NC}"
    fi
    sleep 2
}

view_logs() {
    echo -e "${CYAN}[+] Showing last 50 lines of logs (Press Ctrl+C to exit)...${NC}"
    sleep 1
    journalctl -u AmirTunnel.bin.service -f -n 50
}

uninstall() {
    echo -e "${RED}${BOLD}[!] WARNING: This will remove AmirTunnel completely.${NC}"
    read -p "Are you sure? (y/n): " confirm
    if [[ "$confirm" == "y" || "$confirm" == "Y" ]]; then
        systemctl stop AmirTunnel.bin.service
        systemctl disable AmirTunnel.bin.service
        rm -f $SERVICE_PATH
        rm -f $BIN_PATH
        systemctl daemon-reload
        echo -e "${GREEN}[✔] Uninstalled successfully.${NC}"
    else
        echo -e "${YELLOW}Cancelled.${NC}"
    fi
    sleep 2
}

# --- Main Menu ---

main_menu() {
    while true; do
        show_logo
        echo -e "${GREEN} 1) ${NC} Install - Europe Server (Kharej)"
        echo -e "${GREEN} 2) ${NC} Install - Iran Server"
        draw_line
        echo -e "${CYAN} 3) ${NC} Restart Service"
        echo -e "${CYAN} 4) ${NC} Stop Service"
        echo -e "${CYAN} 5) ${NC} Check Status (Service)"
        echo -e "${CYAN} 6) ${NC} View Live Logs"
        echo -e "${CYAN} 7) ${NC} Edit Configuration Manually"
        draw_line
        echo -e "${PURPLE} 8) ${NC} Enable TCP BBR (Boost Speed)"
        echo -e "${RED} 9) ${NC} Uninstall Completely"
        echo -e "${RED} 0) ${NC} Exit"
        echo ""
        read -p "Select Option: " choice

        case $choice in
            1) install_kharej ;;
            2) install_iran ;;
            3) systemctl restart AmirTunnel.bin.service; echo -e "${GREEN}Restarted!${NC}"; sleep 1 ;;
            4) systemctl stop AmirTunnel.bin.service; echo -e "${RED}Stopped!${NC}"; sleep 1 ;;
            5) systemctl status AmirTunnel.bin.service; read -p "Press Enter..." ;;
            6) view_logs ;;
            7) nano $SERVICE_PATH && systemctl daemon-reload && systemctl restart AmirTunnel.bin.service ;;
            8) enable_bbr ;;
            9) uninstall ;;
            0) exit 0 ;;
            *) echo -e "${RED}Invalid Option!${NC}"; sleep 1 ;;
        esac
    done
}

# --- Start ---
check_root
main_menu