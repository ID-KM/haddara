# 🚀 هدرة — Haddara Chat

دردشة عربية فورية مدعومة بـ **Supabase** + **GitHub Pages**.

## ✨ الميزات

- 🔐 تسجيل دخول / إنشاء حساب (مع كلمة مرور مشفرة)
- 💬 دردشة عامة + محادثات خاصة (DM)
- 👥 **سايدبار** يعرض جميع المستخدمين مع ترتيب حسب آخر مراسلة
- 🔴 **عداد** للرسائل غير المقروءة في الخاص
- 👑 نظام آدمين مع حذف أي رسالة
- 😊 إيموجي بيكر
- 🖊️ تعديل وحذف الرسائل
- 🔊 أصوات Web Audio API
- 🌗 Flip mode (عكس ترتيب الفقاعات)
- 📱 متجاوب مع الموبايل

## 🛠️ التقنيات

- **Supabase** (قاعدة البيانات + Realtime)
- **Vanilla JS** (كود خفيف بدون إطارات)
- **GitHub Pages** (استضافة مجانية)

## 🚀 نشر سريع

1. أنشئ Supabase project
2. نفذ `schema.sql` في SQL Editor
3. غير `SUPABASE_URL` و `SUPABASE_ANON_KEY` في `supabase/index.html`
4. ارفع المجلد `supabase/` على GitHub Pages

## 📁 بنية المشروع

```
haddara/
├── supabase/
│   ├── index.html    ← التطبيق كامل
│   ├── icon.svg      ← الأيقونة
│   └── schema.sql    ← هيكل قاعدة البيانات
└── README.md
```
