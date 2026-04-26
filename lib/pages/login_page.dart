import 'package:flutter/material.dart';
import 'dashboard_page.dart'; // Import halaman dashboard
import 'forgot_password_page.dart'; // Import halaman lupa password

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState(); // Menghubungkan widget dengan state
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>(); // Key untuk validasi form
  bool isLoading = false; // State untuk loading (spinner)

  final nim = TextEditingController(); // Controller untuk mengambil input NIM
  final password =
      TextEditingController(); // Controller untuk mengambil input password

  // Fungsi login
  void login() async {
    // Mengecek apakah form valid
    if (_formKey.currentState!.validate()) {
      setState(() => isLoading = true); // Mengaktifkan loading

      await Future.delayed(Duration(seconds: 2)); // Simulasi proses login (API)

      setState(() => isLoading = false); // Mematikan loading

      // Validasi login sederhana (hardcode)
      if (nim.text == "2401020057" && password.text == "123") {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => DashboardPage(),
          ), // Pindah ke dashboard
        );
      } else {
        // Menampilkan pesan error jika login gagal
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("NIM atau Password salah")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Background putih polos
      appBar: AppBar(
        title: Text("Login"), // Judul halaman
        backgroundColor: Colors.deepPurple, // Warna appbar
      ),
      body: SafeArea(
        // Menghindari area notch/status bar
        child: Center(
          child: SingleChildScrollView(
            // Agar tidak overflow saat keyboard muncul
            child: Container(
              width: 300, // Membatasi lebar form agar tidak terlalu panjang
              padding: EdgeInsets.all(20), // Jarak dalam container
              child: Column(
                children: [
                  // ===== LOGO BULAT BESAR =====
                  CircleAvatar(
                    radius: 60, // Ukuran lingkaran luar (border)
                    backgroundColor: Colors.deepPurple, // Warna border
                    child: CircleAvatar(
                      radius: 55, // Ukuran lingkaran dalam (gambar)
                      backgroundImage: AssetImage(
                        "assets/images/pica.jpg",
                      ), // Mengambil gambar dari assets
                    ),
                  ),

                  SizedBox(height: 20), // Memberi jarak
                  // ===== JUDUL APP =====
                  Text(
                    "PICA APP", // Nama aplikasi
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),

                  SizedBox(height: 20),

                  // ===== FORM LOGIN =====
                  Form(
                    key: _formKey, // Menghubungkan form dengan key
                    child: Column(
                      children: [
                        // Input NIM
                        TextFormField(
                          controller: nim, // Mengambil nilai dari input
                          decoration: InputDecoration(
                            labelText: "NIM", // Label input
                            border: OutlineInputBorder(), // Border kotak
                          ),
                          validator: (value) => value!.isEmpty
                              ? "NIM wajib diisi"
                              : null, // Validasi jika kosong
                        ),

                        SizedBox(height: 15), // Jarak antar field
                        // Input Password
                        TextFormField(
                          controller: password,
                          obscureText: true, // Menyembunyikan teks password
                          decoration: InputDecoration(
                            labelText: "Password",
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) =>
                              value!.isEmpty ? "Password wajib diisi" : null,
                        ),

                        SizedBox(height: 20),

                        // Menampilkan loading atau tombol login
                        isLoading
                            ? CircularProgressIndicator() // Spinner saat loading
                            : SizedBox(
                                width: double.infinity, // Tombol full lebar
                                child: ElevatedButton(
                                  onPressed: login, // Menjalankan fungsi login
                                  child: Text("Login"),
                                ),
                              ),

                        // Tombol menuju halaman lupa password
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    ForgotPasswordPage(), // Navigasi ke halaman lupa password
                              ),
                            );
                          },
                          child: Text("Lupa Password?"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
