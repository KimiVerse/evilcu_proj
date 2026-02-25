# 🚀 AmirTunnel (EvilCU) Pro Auto Installer

![Shell Script](https://img.shields.io/badge/Language-Shell_Script-green?style=for-the-badge&logo=gnu-bash)
![Linux](https://img.shields.io/badge/OS-Linux-blue?style=for-the-badge&logo=linux)
![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg?style=for-the-badge)

<p align="center">
  <img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Objects/Globe%20Showing%20Europe-Africa.png" alt="Globe" width="100" />
</p>

<p align="center">
  <strong>اسکریپت نصب، پیکربندی و مدیریت خودکار امیر تانل (AmirTunnel Pro)</strong>
  <br>
  با رابط کاربری تعاملی، بدون نیاز به دانش فنی پیچیده.
</p>

---

## ✨ ویژگی‌ها (Features)

این اسکریپت تمام مراحل نصب و راه‌اندازی را برای شما خودکار می‌کند:

- 🖥 **منوی گرافیکی و تعاملی:** نصب و مدیریت آسان با انتخاب گزینه‌ها.
- 🌍 **پشتیبانی دو طرفه:** نصب مخصوص سرور **ایران** و سرور **خارج**.
- ⚙️ **مدیریت سرویس:** ساخت سرویس `Systemd` استاندارد (اجرای خودکار پس از ریبوت).
- 🚀 **بهینه‌سازی شبکه:** امکان فعال‌سازی **TCP BBR** جهت افزایش سرعت و پایداری.
- 📊 **مانیتورینگ:** مشاهده لاگ‌های زنده (Live Logs) برای عیب‌یابی.
- 🔄 **آپدیت و ویرایش:** امکان تغییر پورت‌ها و تنظیمات بدون نصب مجدد.

---

## 📥 نصب و اجرا (Installation)

برای نصب، تنها کافیست دستور زیر را در ترمینال سرور خود (هم ایران و هم خارج) کپی و اجرا کنید:

```bash
bash <(curl -Ls https://raw.githubusercontent.com/KimiVerse/evilcu_proj/main/install.sh)
```

---

## 📖 راهنمای استفاده (Tutorial)

پس از اجرای دستور بالا، منوی زیر را مشاهده خواهید کرد:

### 1️⃣ نصب در سرور خارج (Kharej)
1. گزینه `1` را انتخاب کنید.
2. آی‌پی سرور **ایران** را وارد کنید.
3. پورت `Bridge` را وارد کنید (پیش‌فرض: `4444`).
4. پورت `Sync` را وارد کنید (پیش‌فرض: `5555`).
5. تمام! سرویس شما فعال شد.

### 2️⃣ نصب در سرور ایران (Iran)
1. گزینه `2` را انتخاب کنید.
2. پورت `Bridge` را دقیقاً مشابه سرور خارج وارد کنید (پیش‌فرض: `4444`).
3. پورت `Sync` را دقیقاً مشابه سرور خارج وارد کنید (پیش‌فرض: `5555`).
4. انتخاب حالت پورت‌ها:
   - **Auto:** اگر پنل شما پورت‌ها را مدیریت می‌کند.
   - **Manual:** اگر می‌خواهید پورت‌های خاصی (مثل 80, 443) را دستی وارد کنید.

---

## 🛠 ابزارهای مدیریت (Management Tools)

در منوی اصلی به ابزارهای زیر دسترسی دارید:

| گزینه | عملکرد |
| :--- | :--- |
| **Restart Service** | ری‌استارت کردن سرویس تانل جهت اعمال تغییرات. |
| **Stop Service** | متوقف کردن موقت تانل. |
| **Check Status** | مشاهده وضعیت سرویس (Active/Inactive). |
| **View Live Logs** | دیدن لاگ‌های لحظه‌ای برای بررسی اتصال. |
| **Enable TCP BBR** | فعال‌سازی الگوریتم BBR گوگل برای افزایش سرعت شبکه. |
| **Edit Config** | باز کردن فایل تنظیمات برای ویرایش دستی. |
| **Uninstall** | حذف کامل تانل و سرویس‌ها از روی سرور. |

---

## 📸 پیش‌نمایش (Screenshot)

```text
    _    __  __ ___ ____  _____                          _ 
   / \  |  \/  |_ _|  _ \|_   _|   _ _ __  _ __   ___| |
  / _ \ | |\/| || || |_) | | || | | | '_ \| '_ \ / _ \ |
 / ___ \| |  | || ||  _ <  | || |_| | | | | | | |  __/ |
/_/   \_\_|  |_|___|_| \_\ |_| \__,_|_| |_|_| |_|\___|_|
           :: AmirTunnel Pro Installer ::           
           ::    Version: 2.0.0    ::           
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 1)  Install - Europe Server (Kharej)
 2)  Install - Iran Server
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 3)  Restart Service
 4)  Stop Service
 5)  Check Status (Service)
 6)  View Live Logs
...
```

---

## 🔗 منابع و اعتبارات (Credits)

- **Binary Source:** [Evilcu Telegram Channel](http://t.me/Evilcu)
- **Installer Script:** Developed by Community.

---

<p align="center">
  Made with ❤️ for Freedom
</p>