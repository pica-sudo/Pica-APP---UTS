import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Mengambil data user dari halaman login
    final String userEmail =
        ModalRoute.of(context)!.settings.arguments as String;

    // Dummy data untuk ListView (minimal 10 item)
    final List<String> items = List.generate(
      10,
      (index) => "Item ${index + 1}",
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"), // Judul
        actions: [
          IconButton(
            icon: Icon(Icons.logout), // Icon logout
            onPressed: () {
              // Logout dan kembali ke login (hapus semua stack)
              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
            },
          ),
        ],
      ),

      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20),

            // ===== INFORMASI USER =====
            Text(
              "Selamat datang, $userEmail", // Menampilkan user login
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 20),

            // ===== LISTVIEW =====
            Expanded(
              child: ListView.builder(
                itemCount: items.length, // Jumlah item
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    elevation: 5, // Shadow
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // Rounded
                    ),
                    child: ListTile(
                      leading: Icon(Icons.list), // Icon item
                      title: Text(items[index]), // Judul item
                      subtitle: Text("Deskripsi ${items[index]}"), // Subtitle
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

      // ===== OPTIONAL (NILAI TAMBAH) =====
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
