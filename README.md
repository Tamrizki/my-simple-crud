# my_simple_crud

Proyek Flutter sederhana ini menerapkan state management menggunakan Cubit, Clean Architecture, dan dependency injection (DI) dengan GetIt.

## Arsitektur
### 1. Manajemen State dengan Cubit

Cubit digunakan untuk mengelola state aplikasi. UI akan diperbarui berdasarkan perubahan state yang dipicu oleh logika dalam Cubit.

- **home_cubit.dart**: Mengelola logika dan state untuk halaman Home.
- **home_state.dart**: Mendefinisikan berbagai state untuk halaman Home.

### 2. Clean Architecture

Proyek ini mengikuti Clean Architecture dengan membagi kode menjadi lapisan-lapisan berikut:

- Data Layer: Menangani data sumber, model, dan repositori.
- Domain Layer: Berisi logika bisnis dan entitas.
- Presentation Layer: Berisi UI dan Cubit untuk halaman Home.

### 3. Dependency Injection dengan GetIt

GetIt digunakan untuk mengelola dependensi dan mempermudah akses layanan di seluruh aplikasi.
- injection_container.dart: Mengonfigurasi dan mendaftarkan dependensi menggunakan GetIt.

## Dependencies

- dio: ^5.9.1 - HTTP client untuk Flutter.
- flutter_bloc: ^9.1.1 - Package untuk manajemen state menggunakan Cubit.
- bloc: ^9.2.0 - Library inti untuk BLoC.
- equatable: ^2.0.8 - Membantu membandingkan objek di state.
- get_it: ^9.2.0 - Service locator untuk dependency injection (DI).

## Struktur Folder

lib/

- consts: Berisi nilai konstan.
- data: Data source, model, dan repositori.
- di: Konfigurasi DI menggunakan GetIt.
- domain: Entitas dan logika bisnis.
- presentation/home: UI dan Cubit untuk halaman Home.
- page: Halaman utama aplikasi.

## Sumber Endpoint

Pada proyek ini, untuk komunikasi data dengan server, digunakan **JSONPlaceholder API**, yaitu layanan API publik yang menyediakan data palsu untuk keperluan pengujian dan pengembangan.

- link : https://jsonplaceholder.typicode.com/guide/

## Preview


https://github.com/user-attachments/assets/91faf8f5-3300-4e7b-9a22-c5d938db50c5

