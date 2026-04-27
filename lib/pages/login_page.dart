import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState(); // Stateful karena ada state
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>(); // Key validasi form

  final emailController = TextEditingController(); // Controller email
  final passwordController = TextEditingController(); // Controller password

  bool isLoading = false; // State loading
  bool isPasswordVisible = false; // Toggle password
  String errorMessage = ""; // Error message

  // Regex email
  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  // Fungsi login
  void handleLogin() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true; // Aktifkan loading
      });

      await Future.delayed(Duration(seconds: 2)); // Simulasi API

      setState(() {
        isLoading = false; // Matikan loading
      });

      if (emailController.text == "admin@test.com" &&
          passwordController.text == "Admin123") {
        Navigator.pushNamed(
          context,
          '/dashboard',
          arguments: emailController.text,
        );
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Login gagal")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Background clean putih

      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 25,
              ), // Padding kiri kanan
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 40),

                  // ===== LOGO BULAT =====
                  CircleAvatar(
                    radius: 50, // Ukuran besar biar jelas
                    backgroundImage: AssetImage("assets/images/pica.jpg"),
                  ),

                  SizedBox(height: 20),

                  // ===== TITLE =====
                  Text(
                    "PICA APP",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),

                  SizedBox(height: 5),

                  Text(
                    "Silakan login untuk melanjutkan",
                    style: TextStyle(color: Colors.grey),
                  ),

                  SizedBox(height: 30),

                  // ===== CARD FORM =====
                  Container(
                    padding: EdgeInsets.all(20), // Padding dalam card
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15), // Rounded
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12, // Shadow halus
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),

                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          // ===== EMAIL =====
                          TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                              labelText: "Email",
                              prefixIcon: Icon(Icons.email), // Icon kiri
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Email wajib diisi";
                              } else if (!emailRegex.hasMatch(value)) {
                                return "Format email tidak valid";
                              }
                              return null;
                            },
                          ),

                          SizedBox(height: 15),

                          // ===== PASSWORD =====
                          TextFormField(
                            controller: passwordController,
                            obscureText: !isPasswordVisible,
                            decoration: InputDecoration(
                              labelText: "Password",
                              prefixIcon: Icon(Icons.lock),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),

                              // Toggle show/hide
                              suffixIcon: IconButton(
                                icon: Icon(
                                  isPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: () {
                                  setState(() {
                                    isPasswordVisible =
                                        !isPasswordVisible; // Toggle
                                  });
                                },
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Password wajib diisi";
                              } else if (value.length < 8) {
                                return "Minimal 8 karakter";
                              } else if (!RegExp(r'[A-Za-z]').hasMatch(value) ||
                                  !RegExp(r'[0-9]').hasMatch(value)) {
                                return "Harus huruf & angka";
                              }
                              return null;
                            },
                          ),

                          SizedBox(height: 20),

                          // ===== BUTTON LOGIN =====
                          isLoading
                              ? CircularProgressIndicator()
                              : SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: handleLogin,
                                    style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 15,
                                      ), // Tinggi tombol
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    child: Text("Login"),
                                  ),
                                ),

                          SizedBox(height: 10),

                          // ===== LUPA PASSWORD =====
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/forgot');
                              },
                              child: Text("Lupa Password?"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
