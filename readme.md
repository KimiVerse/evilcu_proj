# 🚀 AmirTunnel Pro Auto Installer (v1.0.0)

[![Telegram Channel](https://img.shields.io/badge/Telegram-Channel-blue.svg?logo=telegram)](https://t.me/Evilcu)
![Shell Script](https://img.shields.io/badge/Language-Shell_Script-green?style=for-the-badge&logo=gnu-bash)
![Linux](https://img.shields.io/badge/OS-Linux-blue?style=for-the-badge&logo=linux)

<p align="center" style="font-size: 80px; margin-top: 20px;">
  🌐
</p>

<p align="center">
  <strong>اسکریپت نصب و مدیریت جامع امیر تانل (AmirTunnel Pro)</strong>
  <br>
  نصب، پیکربندی، مانیتورینگ و ایجاد دسترسی سریع تنها با یک دستور.
</p>

---

## ✨ ویژگی‌ها (Features)

- ⚡ **دسترسی سریع خودکار (Auto Shortcut):** پس از نصب، دستور `amirtunnel` به صورت خودکار فعال می‌شود.
- 🗑 **حذف عمیق (Deep Uninstall):** پاکسازی کامل سرویس‌ها و فایل‌ها با یک گزینه.
- 🖥 **رابط کاربری هوشمند:** منوی رنگی، نوار پیشرفت و تشخیص خطا.
- 🛡 **پایداری:** اجرای سرویس به صورت `Systemd` (اجرای خودکار پس از ریبوت).
- 🚀 **شتاب‌دهنده:** امکان فعال‌سازی `TCP BBR` جهت بهبود کیفیت شبکه.

---

## 📥 نصب و اجرا (Installation)

برای اجرای اسکریپت، دستور زیر را در ترمینال سرور خود (هم ایران و هم خارج) وارد کنید:

```bash
bash <(curl -Ls https://raw.githubusercontent.com/KimiVerse/evilcu_proj/main/install.sh)
```

---

## ⚡ دسترسی سریع (Shortcut)

پس از اینکه نصب (گزینه 1 یا 2) با موفقیت انجام شد، اسکریپت به صورت خودکار شورت‌کات را می‌سازد.
از دفعات بعد، برای باز کردن منو فقط کافیست در ترمینال تایپ کنید:

```bash
amirtunnel
```

---

## 📖 راهنمای منو (Menu Guide)

| گزینه | عنوان | توضیحات |
| :--- | :--- | :--- |
| **1** | **Install - Kharej** | نصب نسخه سرور خارج (نیاز به آی‌پی ایران). |
| **2** | **Install - Iran** | نصب نسخه سرور ایران (تنظیم پورت‌ها). |
| **3** | **Restart Service** | ری‌استارت کردن سرویس تانل. |
| **4** | **Stop Service** | خاموش کردن موقت تانل. |
| **5** | **Check Status** | بررسی وضعیت روشن/خاموش بودن سرویس. |
| **6** | **Live Logs** | مشاهده زنده‌ی ترافیک و خطاها (Debug). |
| **7** | **Edit Config** | ویرایش دستی فایل تنظیمات سرویس. |
| **8** | **Enable BBR** | فعال‌سازی الگوریتم افزایش سرعت گوگل. |
| **9** | **Uninstall** | حذف کامل برنامه، سرویس‌ها و شورت‌کات‌ها. |
| **0** | **Exit** | خروج از منو. |

---

## 🗑 حذف کامل (Uninstall)

با انتخاب گزینه **9**، عملیات زیر انجام می‌شود:
1. سرویس تانل متوقف و غیرفعال می‌شود.
2. فایل باینری `AmirTunnel.bin` حذف می‌شود.
3. فایل سرویس `systemd` حذف می‌شود.
4. فایل میانبر `amirtunnel` حذف می‌شود.
5. سیستم کاملاً پاکسازی می‌شود.

---
## 📢 سازنده و منبع (Credits)

هسته اصلی این تانل و باینری‌ها توسط کانال **Evilcu** توسعه داده شده است. این اسکریپت صرفاً یک نصب‌کننده خودکار (Installer) برای تسهیل استفاده از این ابزار قدرتمند است.

<a href="https://t.me/Evilcu">
  <img src="https://img.shields.io/badge/Join_Telegram_Channel-Evilcu-2CA5E0?style=for-the-badge&logo=telegram&logoColor=white" alt="Evilcu Telegram">
</a>

---

<p align="center">
  Made with ❤️ for Freedom
</p>