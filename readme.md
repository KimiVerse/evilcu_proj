# 🚀 AmirTunnel Pro Auto Installer (v1.0.0)

![Shell Script](https://img.shields.io/badge/Language-Shell_Script-green?style=for-the-badge&logo=gnu-bash)
![Linux](https://img.shields.io/badge/OS-Linux-blue?style=for-the-badge&logo=linux)
![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg?style=for-the-badge)

<p align="center">
  <img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Objects/Globe%20Showing%20Europe-Africa.png" alt="Globe" width="100" />
</p>

<p align="center">
  <strong>اسکریپت مدیریت جامع و هوشمند امیر تانل (AmirTunnel Pro)</strong>
  <br>
  نصب، پیکربندی، مانیتورینگ خودکار تنها با یک دستور.
</p>

---

## ✨ ویژگی‌ها (Features)

- ⚡ **دسترسی سریع خودکار (Auto Shortcut):** پس از اولین نصب، دستور `amirtunnel` به صورت خودکار به سیستم شما اضافه می‌شود.
- 🗑 **حذف عمیق (Deep Uninstall):** پاکسازی کامل سرویس‌ها، فایل‌های اجرایی و میانبرها با یک کلیک.
- 🖥 **رابط کاربری هوشمند:** منوی رنگی، نوار پیشرفت (Loading Bar) و تشخیص خطا.
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

## 🔗 اعتبارات (Credits)

- **Core Binary:** [Evilcu Telegram Channel](http://t.me/Evilcu)
- **Installer Script:** Open Source Community Version.

---

<p align="center">
  Made with ❤️ for Freedom
</p>