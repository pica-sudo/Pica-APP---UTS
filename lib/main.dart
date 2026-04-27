import 'package:flutter/material.dart';

// Import semua halaman (screen)
import 'pages/login_page.dart';
import 'pages/forgot_password_page.dart';
import 'pages/dashboard_page.dart';

void main() {
  runApp(PicaApp()); // Menjalankan aplikasi utama
}

class PicaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Menghilangkan banner debug
      title: 'PICA APP', // Nama aplikasi
      // Tema aplikasi
      theme: ThemeData(
        primarySwatch: Colors.deepPurple, // Warna utama
      ),

      // ===== INITIAL ROUTE =====
      initialRoute: '/', // Halaman pertama saat app dibuka
      // ===== DAFTAR ROUTES (WAJIB MINIMAL 3) =====
      routes: {
        '/': (context) => LoginPage(), // Halaman login
        '/forgot': (context) => ForgotPasswordPage(), // Halaman lupa password
        '/dashboard': (context) => DashboardPage(), // Halaman dashboard
      },

      // Catatan:
      // Semua navigasi sekarang menggunakan:
      // Navigator.pushNamed(context, '/route')
      // BUKAN MaterialPageRoute lagi (sesuai soal)
    );
  }
}
