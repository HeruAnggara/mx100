
MX100

## Installation

1. Clone Repositori

    git clone 

    cd mx100-api

2. Install Depedencies

    composer install

3. Buat File Environment

    cp .env.example .env

4. Generate Application Key

    php artisan key:generate

5. Konfigurasi .env

    DB_CONNECTION=mysql
    DB_HOST=127.0.0.1
    DB_PORT=3306
    DB_DATABASE=mx100_db
    DB_USERNAME=root
    DB_PASSWORD=

6. Konfigurasi Database

    Anda memiliki dua pilihan untuk menyiapkan database.

    ### Opsi 1: Menggunakan Migration & Seeder
    Opsi ini akan membuat semua tabel dan mengisinya dengan data sampel (5 employer, 5 freelancer, 5 jobs) secara otomatis.

    Pastikan Anda sudah membuat database mx100_db (atau nama lain  sesuai .env).

    Jalankan perintah berikut:
    php artisan migrate:fresh --seed

    ### Opsi 2: Menggunakan Import SQL

    ika Anda lebih suka mengimpor dari file SQL yang sudah disiapkan.

    Pastikan file mx100_db.sql tersedia di root proyek.

    Buat database mx100_db (atau nama lain sesuai .env).

    Jalankan perintah import dari terminal Anda:  
    mysql -u [USERNAME_DB] -p [NAMA_DB] < mx100_db.sql


## Run Locally

1. Buat Storage Link

    php artisan storage:link

2. Jalankan Server Development

    php artisan serve


## Documentation API

1. Otentikasi

    Langkah awal adalah mendaftarkan akun dan login untuk mendapatkan token.

    POST /api/register

    Mendaftarkan user baru sebagai employer atau freelancer.

    POST /api/login

    Login untuk mendapatkan access_token.

    POST /api/logout

    Keluar dan menghapus token yang sedang aktif (memerlukan otentikasi).

2. Manajemen Profil

    GET /api/profile

    Melihat detail profil sendiri.

    PUT /api/profile

    Memperbarui detail profil. Penting: Gunakan form-data dengan _method: PUT jika meng-upload CV.

3. Alur Freelancer

    GET /api/freelancer/jobs

    Melihat daftar semua pekerjaan yang sudah di-publish, lengkap dengan paginasi.

    GET /api/freelancer/jobs/{id}

    Melihat detail satu pekerjaan spesifik.

    POST /api/freelancer/jobs/{id}/apply

    Mengirim lamaran ke sebuah pekerjaan. Hanya bisa dilakukan satu kali per pekerjaan.

4. Alur Employer

    POST /api/employer/jobs

    Membuat lowongan pekerjaan baru. Status awal otomatis adalah draft.

    GET /api/employer/jobs

    Melihat daftar semua pekerjaan yang telah dibuat oleh employer tersebut.

    GET /api/employer/jobs/{id}

    Melihat detail pekerjaan milik sendiri, termasuk jumlah pelamar.

    PUT /api/employer/jobs/{id}

    Memperbarui detail pekerjaan. Bisa digunakan untuk mengubah status dari draft menjadi published.

    DELETE /api/employer/jobs/{id}

    Menghapus pekerjaan milik sendiri.

    GET /api/employer/jobs/{id}/applicants

    Melihat daftar lengkap semua freelancer yang telah melamar ke pekerjaan tersebut.



