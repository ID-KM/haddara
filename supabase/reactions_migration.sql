-- ═════════════════════════════════════════════════════════
-- 🏗️  إنشاء جدول التفاعلات (Reactions)
-- ═════════════════════════════════════════════════════════
-- شغل هذا الكود في SQL Editor فـ Supabase Dashboard:
-- https://supabase.com/dashboard/project/momeodjgthtcavkdvbay/sql/new
-- ═════════════════════════════════════════════════════════

-- 1. إنشاء الجدول
CREATE TABLE IF NOT EXISTS reactions (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    message_id BIGINT NOT NULL REFERENCES messages(id) ON DELETE CASCADE,
    user_id UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
    emoji TEXT NOT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    UNIQUE(message_id, user_id, emoji)
);

-- 2. إضافة فهرس للبحث السريع
CREATE INDEX IF NOT EXISTS idx_reactions_message ON reactions(message_id);
CREATE INDEX IF NOT EXISTS idx_reactions_user ON reactions(user_id);

-- 3. تفعيل Realtime للجدول
-- (هذا يتطلب تمكين Realtime من الواجهة)
-- اذهب إلى Database → Replication وافعل realtime لجدول reactions
