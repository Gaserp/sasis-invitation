# Sasis Invitation (v5.0) · Multi-Product Platform

Platform resmi **Sasis Invitation** (*by Sasis Digital Agency*): Ekosistem pembuatan dan pemesanan undangan modern yang mencakup 4 pilar produk utama dengan standar estetika mewah, animasi 3D pelaminan interaktif, integrasi WhatsApp otomatis, dan database realtime Supabase.

---

## 🌟 4 Lini Produk Utama

1. **🌐 Undangan Website (2D & 3D Interactive)**
   - 22+ template tema responsif (Wedding, Khitan, Aqiqah, Birthday, Wisuda, Acara Formal).
   - Efek 3D Pelaminan Parallax, Gapura Joglo Jawa, 3D Cube, dan amplop buka interaktif.
   - Personalisasi nama tamu instan via parameter URL (`?to=Nama+Tamu`).
   - Fitur RSVP konfirmasi kehadiran & amplop digital (Direct copy rekening bank & QRIS).
   - WhatsApp broadcast assistant untuk pengiriman masif satu-satu ke daftar kontak.

2. **💌 Undangan Cetak (Exclusive Physical Print)**
   - Pilihan bahan premium: *Jasmine Luxury Paper (230-310 gsm)*, *Hardcover Board Gold Foil*, dan *Akrilik Bening 2mm UV Print*.
   - Termasuk gratis plastik OPP, kartu souvenir, dan stiker label nama tamu.
   - Tombol konsultasi dan pemesanan WhatsApp otomatis.

3. **🎬 Undangan Video 3D (Cinematic Video)**
   - Video animasi 3D berdurasi 30-60 detik resolusi Full HD rasio vertikal 9:16 (Instagram Reels, TikTok, WhatsApp Story).
   - Pilihan tema: *Traditional Joglo Adat*, *Modern Luxury Gold*, *Floral Garden Romance*, dan *Islamic Architectural*.
   - Musik latar romantis dan transisi teks nama pengantin dinamis.

4. **✨ Video Ucapan 3D (Personalized Greeting Video)**
   - Format video kado ucapan selamat & doa berkelas dengan nama pengirim dan ucapan khusus berformat 3D.
   - Pilihan kategori: Pernikahan sahabat, kelulusan wisuda, perayaan hari raya, dan korporat.

---

## 📁 Struktur Berkas Proyek

```
C:\Users\fakhr\projects\Sasis Invitation\
├── index.html                  # File entri utama aplikasi (versi v5.0)
├── sasis-invitation-v5.0.html  # Versi 5.0 lengkap dengan 4 lini produk & Supabase
├── sasis-invitation-v4.1.html  # Versi 4.1 (cadangan aman)
├── supabase-schema.sql         # Skrip SQL untuk database Supabase PostgreSQL
└── README.md                   # Dokumentasi panduan penggunaan
```

---

## ⚙️ Konfigurasi Global (`window.SASIS_CONFIG`)

Pengaturan nomor WhatsApp, harga paket, dan database Supabase terletak di bagian atas file `index.html` / `sasis-invitation-v5.0.html`:

```javascript
window.SASIS_CONFIG = {
  adminWa: '628569000604', // WhatsApp Resmi Pemesanan Sasis Invitation
  brandName: 'Sasis Invitation',
  tagline: 'Platform Undangan Digital 3D, Cetak, dan Video Sinematik',
  appUrl: '', // Kosongkan atau isi URL website Anda jika sudah di-hosting
  supabase: {
    url: '',     // Contoh: 'https://xyzcompany.supabase.co'
    anonKey: '', // Kunci publik Anon Key dari dashboard Supabase
    enabled: false
  },
  plans: [
    { name: 'Basic Website', price: '79.000', oldPrice: '199.000', period: '7 hari', ... },
    { name: 'Paket Kombo Video', price: '149.000', oldPrice: '299.000', period: '30 hari', featured: true, ... },
    { name: 'VIP All-In-One', price: '299.000', oldPrice: '599.000', period: '1 tahun', ... }
  ]
};
```

---

## 🗄️ Menghubungkan Supabase Realtime (2 Menit)

1. Buka dashboard proyek Anda di [Supabase](https://supabase.com).
2. Masuk ke menu **SQL Editor**, buka file `supabase-schema.sql` di proyek ini, salin seluruh isinya, lalu klik **Run**.
3. Masuk ke menu **Project Settings** $\rightarrow$ **API**.
4. Salin **Project URL** dan **anon public key**.
5. Buka `index.html` (atau `sasis-invitation-v5.0.html`), lalu tempelkan ke konfigurasi:
   ```javascript
   supabase: {
     url: 'https://proyek-anda.supabase.co',
     anonKey: 'eyJh......',
     enabled: true
   }
   ```
6. Selesai! Seluruh konfirmasi kehadiran (RSVP) dan ucapan doa tamu akan tersimpan otomatis secara real-time di tabel `sasis_rsvp_greetings`.
*(Catatan: Jika Supabase belum diisi, aplikasi otomatis menggunakan fallback LocalStorage + WhatsApp tanpa error).*

---

## 🚀 Cara Menjalankan & Mempublikasikan

### Preview Lokal
Cukup klik ganda pada file `index.html` atau buka menggunakan browser Google Chrome / Microsoft Edge.

### Deployment ke Vercel / Web Hosting
1. Unggah folder `Sasis Invitation` ke repositori GitHub Anda.
2. Hubungkan ke [Vercel](https://vercel.com) menggunakan framework preset **Other** (Static HTML).
3. Website akan langsung aktif dengan HTTPS dan siap menerima pesanan dari seluruh Indonesia!
