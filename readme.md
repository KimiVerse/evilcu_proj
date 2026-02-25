# 🚀 AmirTunnel Pro Auto Installer (v1.0) - EvilCu

![Shell Script](https://img.shields.io/badge/Language-Shell_Script-green?style=for-the-badge&logo=gnu-bash)
![Linux](https://img.shields.io/badge/OS-Linux-blue?style=for-the-badge&logo=linux)
![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg?style=for-the-badge)

<p align="center">
  <img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Objects/Globe%20Showing%20Europe-Africa.png" alt="Globe" width="100" />
</p>

<p align="center">
  <strong>اسکریپت مدیریت جامع و هوشمند امیر تانل (AmirTunnel Pro)</strong>
  <br>
  نصب، پیکربندی، مانیتورینگ و ساخت میانبر دسترسی سریع تنها با یک دستور.
</p>

---

## ✨ ویژگی‌های جدید (New Features)

- ⚡ **دسترسی سریع (Shortcut):** قابلیت ایجاد دستور `amirtunnel` در ترمینال برای دسترسی همیشگی به منو بدون نیاز به دانلود مجدد.
- 🗑 **حذف عمیق (Deep Uninstall):** پاکسازی کامل سرویس‌ها، فایل‌های اجرایی و میانبرها با یک کلیک.
- 🖥 **رابط کاربری بهبود یافته:** منوی رنگی، نوار پیشرفت (Loading Bar) و تشخیص خطا.
- 🛡 **پایداری:** تنظیم مجدد خودکار سرویس‌ها پس از تغییر تنظیمات.
- 🚀 **شتاب‌دهنده:** فعال‌سازی `TCP BBR` جهت بهبود کیفیت شبکه.

---

## 📥 نصب و اجرا (Installation)

برای اجرای اسکریپت، دستور زیر را در ترمینال سرور خود (هم ایران و هم خارج) وارد کنید:

```bash
bash <(curl -Ls https://raw.githubusercontent.com/USERNAME/REPOSITORY/main/install.sh)
```

> ⚠️ **توجه:** لطفاً به جای `USERNAME` و `REPOSITORY` نام کاربری و نام مخزن گیت‌هاب خود را جایگزین کنید.

---

## ⚡ ایجاد دسترسی سریع (Shortcut)

بعد از اولین اجرا، پیشنهاد می‌شود **گزینه 9** را انتخاب کنید.
با این کار، اسکریپت روی سرور شما نصب می‌شود و از این پس هر زمان که بخواهید وارد منو شوید، کافیست فقط کلمه زیر را تایپ کنید:

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
| **9** | **Create Shortcut** | ساخت دستور `amirtunnel` برای دسترسی راحت. |
| **0** | **Uninstall** | حذف کامل برنامه، سرویس‌ها و شورت‌کات‌ها. |

---

## ⚙️ راهنمای کانفیگ (Configuration)

### 1️⃣ سرور خارج (Kharej)
1. گزینه `1` را انتخاب کنید.
2. آی‌پی سرور ایران را وارد کنید.
3. پورت‌های `Bridge` و `Sync` را وارد کنید (یا اینتر بزنید تا پیش‌فرض `4444` و `5555` انتخاب شود).

### 2️⃣ سرور ایران (Iran)
1. گزینه `2` را انتخاب کنید.
2. پورت‌های `Bridge` و `Sync` را دقیقاً مشابه سرور خارج وارد کنید.
3. در مرحله **Auto Xray Sync**:
   - گزینه **1 (Auto):** اگر می‌خواهید تانل خودش پورت‌ها را پیدا کند.
   - گزینه **2 (Manual):** اگر می‌خواهید پورت‌های خاص (مثل 80, 443) را دستی وارد کنید.

---

## 🗑 حذف کامل (Uninstall)

با انتخاب گزینه **0**، عملیات زیر انجام می‌شود:
1. سرویس تانل متوقف و غیرفعال می‌شود.
2. فایل باینری `AmirTunnel.bin` حذف می‌شود.
3. فایل سرویس `systemd` حذف می‌شود.
4. فایل میانبر `amirtunnel` حذف می‌شود.
5. سیستم به حالت قبل از نصب باز می‌گردد.

---

## 🔗 اعتبارات (Credits)

- **Core Binary:** [Evilcu Telegram Channel](http://t.me/Evilcu)
- **Installer Script:** Open Source Community Version.

---

<p align="center">
  Made with ❤️ for Freedom
</p>