-- ═════════════════════════════════════════════════════════
-- 🏗️  إنشاء جدول التفاعلات (Reactions)
-- ═════════════════════════════════════════════════════════
-- شغل هذا الكود في SQL Editor فـ Supabase Dashboard:
-- https://supabase.com/dashboard/project/momeodjgthtcavkdvbay/sql/new
-- ═════════════════════════════════════════════════════════

-- 1. إنشاء الجدول (بـ TEXT عوض UUID باش يتوافق مع السكيما ديالك)
CREATE TABLE IF NOT EXISTS reactions (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    message_id BIGINT NOT NULL REFERENCES messages(id) ON DELETE CASCADE,
    user_id TEXT NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
    emoji TEXT NOT NULL,
    created_at BIGINT NOT NULL DEFAULT (EXTRACT(EPOCH FROM now()) * 1000)::BIGINT,
    UNIQUE(message_id, user_id, emoji)
);

-- 2. فهارس للبحث السريع
CREATE INDEX IF NOT EXISTS idx_reactions_message ON reactions(message_id);
CREATE INDEX IF NOT EXISTS idx_reactions_user ON reactions(user_id);

-- 3. RLS (public access like باقي الجداول)
ALTER TABLE reactions ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Anyone can read reactions" ON reactions FOR SELECT USING (true);
CREATE POLICY "Anyone can insert reactions" ON reactions FOR INSERT WITH CHECK (true);
CREATE POLICY "Anyone can delete reactions" ON reactions FOR DELETE USING (true);

-- 4. Realtime
ALTER PUBLICATION supabase_realtime ADD TABLE reactions;
