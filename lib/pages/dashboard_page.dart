import 'package:flutter/material.dart';
import 'login_page.dart'; // Import login untuk kembali (logout)

class DashboardPage extends StatelessWidget {
  // Membuat data dummy
  final List<String> data = List.generate(10, (i) => "Menu ${i + 1}");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Background putih
      appBar: AppBar(
        title: Text("Dashboard"),
        backgroundColor: Colors.deepPurple,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Logout kembali ke login
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => LoginPage()),
            );
          },
        ),
      ),
      body: ListView.builder(
        itemCount: data.length, // Jumlah item
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10), // Jarak antar card
            child: ListTile(
              leading: Icon(Icons.dashboard), // Icon kiri
              title: Text(data[index]), // Judul
              subtitle: Text("Deskripsi menu"), // Subjudul
            ),
          );
        },
      ),
    );
  }
}
