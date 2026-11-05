-- ==============================================================================
-- Sasis Invitation · Supabase PostgreSQL Schema
-- Tabel untuk Sinkronisasi Buku Tamu (RSVP) & Ucapan Doa Realtime
-- ==============================================================================

-- 1. Buat Tabel sasis_rsvp_greetings
CREATE TABLE IF NOT EXISTS public.sasis_rsvp_greetings (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    invitation_slug VARCHAR(100) NOT NULL DEFAULT 'demo',
    guest_name VARCHAR(150) NOT NULL,
    attendance VARCHAR(20) NOT NULL CHECK (attendance IN ('hadir', 'tidak_hadir', 'ragu')),
    total_guests INT DEFAULT 1,
    message TEXT NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    is_hidden BOOLEAN NOT NULL DEFAULT false
);

-- 2. Index untuk Query Cepat Berdasarkan Undangan dan Waktu
CREATE INDEX IF NOT EXISTS idx_sasis_rsvp_slug ON public.sasis_rsvp_greetings (invitation_slug);
CREATE INDEX IF NOT EXISTS idx_sasis_rsvp_created ON public.sasis_rsvp_greetings (created_at DESC);

-- 3. Aktifkan Row Level Security (RLS)
ALTER TABLE public.sasis_rsvp_greetings ENABLE ROW LEVEL SECURITY;

-- 4. Kebijakan Keamanan (RLS Policies):
-- Izinkan siapa saja membaca ucapan doa publik (yang tidak di-hide)
CREATE POLICY "Public can view active rsvp greetings" 
ON public.sasis_rsvp_greetings 
FOR SELECT 
USING (is_hidden = false);

-- Izinkan siapa saja mengirim konfirmasi kehadiran / ucapan
CREATE POLICY "Public can insert rsvp greeting" 
ON public.sasis_rsvp_greetings 
FOR INSERT 
WITH CHECK (
    char_length(guest_name) >= 2 AND 
    char_length(message) >= 2
);

-- 5. Tabel Konfigurasi Tambahan (Opsional: untuk menyimpan metadata undangan)
CREATE TABLE IF NOT EXISTS public.sasis_invitation_meta (
    slug VARCHAR(100) PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    category VARCHAR(50) DEFAULT 'wedding',
    groom_name VARCHAR(100),
    bride_name VARCHAR(100),
    event_date TIMESTAMPTZ,
    theme_id VARCHAR(50) DEFAULT 'minimalis',
    music_url TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

ALTER TABLE public.sasis_invitation_meta ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Public can read invitation meta" 
ON public.sasis_invitation_meta 
FOR SELECT 
USING (true);
