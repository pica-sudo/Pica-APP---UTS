import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState(); // Stateful karena ada loading state
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>(); // Key untuk validasi form
  final emailController = TextEditingController(); // Controller input email

  bool isLoading = false; // State loading saat kirim email

  // Regex validasi email
  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  // Fungsi kirim reset password
  void handleReset() async {
    if (_formKey.currentState!.validate()) {
      // Validasi form
      setState(() {
        isLoading = true; // Aktifkan loading
      });

      await Future.delayed(Duration(seconds: 2)); // Simulasi proses kirim email

      setState(() {
        isLoading = false; // Matikan loading
      });

      // Tampilkan dialog sukses
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Berhasil"),
          content: Text(
            "Link reset telah dikirim ke email Anda",
          ), // Sesuai soal
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
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lupa Password"), // Judul halaman
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20), // Padding utama
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),

              Text(
                "Masukkan Email Anda",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 20),

              // ===== FORM EMAIL =====
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: "Email",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Email tidak boleh kosong";
                        } else if (!emailRegex.hasMatch(value)) {
                          return "Format email tidak valid";
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: 20),

                    // ===== BUTTON KIRIM =====
                    isLoading
                        ? Center(child: CircularProgressIndicator()) // Loading
                        : SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: handleReset,
                              child: Text("Kirim Link Reset"),
                            ),
                          ),
                  ],
                ),
              ),

              SizedBox(height: 20),

              // ===== BUTTON KEMBALI =====
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Kembali ke login
                  },
                  child: Text("Kembali ke Login"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
