# my_simple_crud

Ini adalah aplikasi sederhana yang dibangun menggunakan **Dart/Flutter** dengan **GetX** sebagai state management, menerapkan prinsip **Clean Architecture**, dan menggunakan **Dio** untuk komunikasi HTTP. Proyek ini menunjukkan cara mengatur arsitektur yang terorganisir dan skalabel pada aplikasi Flutter.

## Teknologi yang Digunakan

- **Flutter**: Framework untuk membangun aplikasi mobile.
- **GetX**: State management yang ringan dan mudah digunakan untuk Flutter.
- **Clean Architecture**: Pendekatan untuk memisahkan lapisan-lapisan aplikasi agar lebih mudah dikelola dan diuji.
- **Dio**: Library HTTP client yang cepat dan fleksibel untuk berinteraksi dengan API.

## Struktur Proyek
```
lib/
├── data/
│ ├── datasources/
│ │ ├── datasource_impl.dart
│ │ └── datasource.dart
│ ├── models/
│ │ ├── base_response_model.dart
│ │ └── post_item_model.dart
│ └── repositories/
│ ├── repositories_impl.dart
│ └── repositories.dart
├── domain/
│ ├── entities/
│ │ └── post_item.dart
│ ├── mappers/
│ │ └── post_item_mapper.dart
│ └── params/
│ └── post_params.dart
├── presentation/
│ ├── home/
│ │ ├── get/
│ │ │ ├── home_binding.dart
│ │ │ ├── home_controller.dart
│ │ ├── page/
│ │ │ └── home_page.dart
│ ├── main/
│ │ ├── main_binding.dart
│ │ └── pages.dart
└── main.dart
.gitignore
```

- **data**: Menyimpan lapisan data seperti data sources (API atau database), models, dan repositori.
- **domain**: Berisi entitas yang mewakili objek dalam aplikasi serta logika bisnis (mappers, params).
- **presentation**: Berisi tampilan aplikasi, seperti halaman utama dan logika tampilan (controller dan binding) dengan **GetX**.
- **main.dart**: Titik masuk aplikasi yang menginisialisasi dan menjalankan aplikasi Flutter.

## Fitur Utama

- **State Management dengan GetX**: Memudahkan pengelolaan state aplikasi secara reaktif.
- **Clean Architecture**: Memisahkan aplikasi ke dalam beberapa lapisan (Data, Domain, dan Presentation) untuk meningkatkan keterbacaan dan pemeliharaan kode.
- **HTTP Requests dengan Dio**: Menggunakan Dio untuk membuat permintaan HTTP yang efisien dan mudah dikelola.

## Sumber Endpoint

Pada proyek ini, untuk komunikasi data dengan server, digunakan **JSONPlaceholder API**, yaitu layanan API publik yang menyediakan data palsu untuk keperluan pengujian dan pengembangan.

- link : https://jsonplaceholder.typicode.com/guide/

## Preview


https://github.com/user-attachments/assets/91faf8f5-3300-4e7b-9a22-c5d938db50c5

