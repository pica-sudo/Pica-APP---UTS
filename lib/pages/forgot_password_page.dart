import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatelessWidget {
  final TextEditingController email =
      TextEditingController(); // Controller untuk input email

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Background putih polos
      appBar: AppBar(
        title: Text("Lupa Password"), // Judul halaman
        backgroundColor: Colors.deepPurple, // Warna appbar
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Icon tombol kembali
          onPressed: () {
            Navigator.pop(context); // Kembali ke halaman login
          },
        ),
      ),
      body: Center(
        child: Container(
          width: 300, // Membatasi lebar agar tidak terlalu panjang
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Tinggi mengikuti isi
            children: [
              Icon(Icons.email, size: 60), // Icon email

              SizedBox(height: 20),

              // INPUT EMAIL
              TextField(
                controller: email, // Mengambil input email
                decoration: InputDecoration(
                  labelText: "Masukkan Email", // Label input
                  border: OutlineInputBorder(),
                ),
              ),

              SizedBox(height: 20),

              // TOMBOL KIRIM
              ElevatedButton(
                onPressed: () {
                  // Menampilkan dialog notifikasi
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: Text("Berhasil"), // Judul dialog
                      content: Text(
                        "Permintaan verifikasi ganti password sudah dikirim ke Gmail",
                      ), // Pesan sesuai permintaan
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context); // Tutup dialog
                          },
                          child: Text("OK"),
                        ),
                      ],
                    ),
                  );
                },
                child: Text("Kirim"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
