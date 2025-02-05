# Sistem Penjualan Online

Sistem Penjualan Online adalah aplikasi berbasis web yang dikembangkan menggunakan CodeIgniter 3 untuk mengelola transaksi penjualan secara online. Proyek ini menggunakan database MySQL dan dapat dijalankan di lingkungan lokal menggunakan XAMPP.

## Persyaratan

- XAMPP atau server lokal lainnya dengan PHP dan MySQL
- CodeIgniter 3.1.13
- Web browser modern (Chrome, Firefox, Edge, dll.)

## Instalasi

### 1. Clone atau Download Proyek

Unduh atau clone repositori ini ke dalam folder **htdocs** XAMPP:

```sh
cd C:\xampp\htdocs
```

```sh
git clone https://github.com/username/sistempenjualanonline.git
```

atau unduh dan ekstrak ke dalam folder **htdocs**.

### 2. Konfigurasi Database

1. Buka **phpMyAdmin** melalui `http://localhost/phpmyadmin/`
2. Buat database baru dengan nama **sistempenjualanonline**
3. Impor file **sistempenjualanonline.sql** ke dalam database yang baru dibuat:
   - Klik **Import**
   - Pilih file **sistempenjualanonline.sql** dari folder proyek
   - Klik **Go**

### 3. Konfigurasi CodeIgniter

1. Buka file konfigurasi database di `application/config/database.php`
2. Sesuaikan konfigurasi berikut sesuai dengan database yang dibuat:

```php
$active_group = 'default';
$query_builder = TRUE;

$db['default'] = array(
    'dsn'   => '',
    'hostname' => 'localhost',
    'username' => 'root', // Sesuaikan jika ada password
    'password' => '', // Default kosong jika menggunakan XAMPP
    'database' => 'sistempenjualanonline',
    'dbdriver' => 'mysqli',
    'dbprefix' => '',
    'pconnect' => FALSE,
    'db_debug' => (ENVIRONMENT !== 'production'),
    'cache_on' => FALSE,
    'cachedir' => '',
    'char_set' => 'utf8',
    'dbcollat' => 'utf8_general_ci',
    'swap_pre' => '',
    'encrypt' => FALSE,
    'compress' => FALSE,
    'stricton' => FALSE,
    'failover' => array(),
    'save_queries' => TRUE
);
```

3. Buka file `application/config/config.php` dan ubah base URL sesuai dengan proyek Anda:

```php
$config['base_url'] = 'http://localhost/sistempenjualanonline/';
```

### 4. Menjalankan Aplikasi

1. Jalankan XAMPP dan aktifkan Apache serta MySQL.
2. Akses aplikasi melalui browser:

```
http://localhost/sistempenjualanonline/
```

## Akun Default

Setelah mengimpor database, gunakan akun berikut untuk login:

- **Username:** admin
- **Password:** admin123

## Struktur Folder Utama

```
/application  # Folder utama CodeIgniter
/assets       # Folder untuk CSS, JavaScript, dan gambar
/database     # Folder berisi file SQL
/system       # Sistem inti CodeIgniter
/index.php    # File utama untuk menjalankan aplikasi
```

## Fitur Utama

- Manajemen Produk
- Manajemen Pelanggan
- Manajemen Pesanan
- Laporan Penjualan
- Sistem Login & Hak Akses

## Lisensi

Proyek ini bersifat open-source dan bebas digunakan.

---

Dikembangkan dengan ❤️ menggunakan CodeIgniter 3.

"Rahmat Mulia"
