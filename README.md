# Tugas Praktikum

## 1. Selesaikan Praktikum 1 dan 2, lalu dokumentasikan dan push ke repository Anda berupa screenshot setiap hasil pekerjaan beserta penjelasannya di file README.md! Jika terdapat error atau kode yang tidak dapat berjalan, silahkan Anda perbaiki 
## 2. sesuai tujuan aplikasi dibuat!
## 3. Gabungkan hasil praktikum 1 dengan hasil praktikum 2 sehingga setelah melakukan pengambilan foto, dapat dibuat filter carouselnya!
## 4. Jelaskan maksud void async pada praktikum 1?
## 5. Jelaskan fungsi dari anotasi @immutable dan @override ?

# Jawaban

# Praktikum 3: Aplikasi kamera yang bisa menerapkan filter pada gambar yang sudah di ambil

## Deskripsi
Aplikasi ini merupakan implementasi kamera pada Flutter yang memungkinkan pengguna untuk mengambil foto menggunakan kamera perangkat dan setelah mengambil foto, pengguna dapat menerapkan filter pada gambar yang sudah di ambil.

## Tujuan Aplikasi Dibuat
Aplikasi ini dibuat dengan tujuan untuk **mengambil foto menggunakan kamera perangkat dan menampilkan hasil foto dengan berbagai filter atau efek yang dapat dipilih oleh pengguna**. menggunakan beberapa widget tambahan seperti `TakePictureScreen` dan `FilterCarousel`. aplikasi ini juga mendukung penggunaan beberapa kamera yang tersedia di perangkat (misalnya kamera depan dan belakang) `availableCameras()` . Aplikasi ini juga menyediakan antarmuka sederhana yang mudah digunakan dan memungkinkan pengguna untuk:

1. **Mengakses kamera perangkat secara langsung.**
2. **Mengambil gambar dari kamera dan menyimpannya.**
3. **Menggunakan filter atau efek tertentu pada gambar yang diambil.**
4. **Menampilkan hasil foto yang sudah difilter dengan tampilan yang menarik.**

# Screenshot Hasil
#Praktikum 1 Kamera
![Screenshot aplikasi kamera](assets/kamera.gif)

#Praktikum 2 Filter Carousel
![Screenshot aplikasi kamera](assets/photo-filter-carousel.gif)

#Praktikum 3 Menggabungkan Kamera dan Filter Carousel
![Screenshot aplikasi kamera](assets/kamera-dan-photo-filter-carousel.gif)

#### Penjelasan
1. pengguna dapat mengambil gambar pada aplikasi
2. pengguna dapat memilih filter yang ingin diterapkan pada gambar yang sudah di ambil
3. pengguna dapat melihat hasil gambar yang sudah diterapkan filter
4. pengguna dapat menyimpan hasil gambar yang sudah diterapkan filter ke galeri perangkat (belum di implementasikan)
5. pengguna dapat mengulangi proses mengambil gambar dan menerapkan filter (belum di implementasikan)

```markdown
# Penggunaan `void async` pada Praktikum 1
`void async` digunakan dalam fungsi `main()` untuk memungkinkan penggunaan operasi asynchronous di dalamnya. Pada praktikum 1, operasi asynchronous digunakan untuk mendapatkan daftar kamera yang tersedia dengan memanggil fungsi `availableCameras()` yang membutuhkan waktu untuk menyelesaikan prosesnya.  

Karena operasi ini bisa memakan waktu yang tidak diketahui (bergantung pada perangkat), maka perlu ditandai dengan kata kunci `async` agar aplikasi tidak berhenti sementara menunggu hasilnya. Kata kunci `await` digunakan untuk menunggu hasil dari operasi asynchronous tersebut sebelum melanjutkan ke proses berikutnya.  

### Contoh penggunaan:  
```dart
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  final firstCamera = cameras.first;

  runApp(
    MaterialApp(
      theme: ThemeData.dark(),
      home: TakePictureScreen(camera: firstCamera),
      debugShowCheckedModeBanner: false,
    ),
  );
}
```
Dengan menggunakan `async`, aplikasi dapat mengelola operasi yang membutuhkan waktu lama (seperti mengambil daftar kamera) tanpa mengganggu proses utama dari aplikasi tersebut.  

---

# Penggunaan Fungsi dari Anotasi `@immutable` dan `@override`

## `@immutable`
Anotasi `@immutable` digunakan untuk menandai sebuah kelas agar menjadi **immutable** atau tidak dapat diubah setelah dibuat. Artinya, semua properti dalam kelas tersebut harus bersifat `final`.  

Tujuannya adalah untuk membuat objek menjadi lebih aman, terprediksi, dan menghindari perubahan yang tidak disengaja setelah objek tersebut dibuat. Hal ini sering diterapkan pada widget yang bersifat **stateless**.  

### Contoh penggunaan:  
```dart
@immutable
class MyWidget extends StatelessWidget {
  final String title;

  const MyWidget({Key? key, required this.title}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Text(title);
  }
}
```
Dalam contoh di atas, kelas `MyWidget` ditandai dengan `@immutable`, yang berarti semua propertinya (seperti `title`) harus `final`.  

---

## `@override`
Anotasi `@override` digunakan untuk **menyatakan bahwa sebuah metode atau fungsi yang didefinisikan di kelas turunan akan menggantikan atau mengubah perilaku dari metode atau fungsi yang ada di kelas induknya**.  

Fungsi ini tidak bersifat wajib, namun dianjurkan agar kode menjadi lebih jelas dan mudah dipahami. Selain itu, `@override` membantu compiler mengenali jika terjadi kesalahan penulisan atau ketidaksesuaian antara fungsi yang didefinisikan dengan fungsi induknya.  

### Contoh penggunaan:  
```dart
class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('Hello, world!');
  }
}
```
Dalam contoh di atas, fungsi `build()` menimpa fungsi `build()` dari kelas `StatelessWidget`.  

---

> 🔑 **Catatan:** Fungsi dari `@immutable` dan `@override` bersifat tetap dan tidak berubah tergantung pada proyek. Mereka digunakan sesuai dengan kebutuhan yang ingin dicapai, seperti menjaga agar objek tetap tidak dapat diubah (`@immutable`) atau memastikan metode yang didefinisikan menimpa metode yang ada (`@override`).  

---
