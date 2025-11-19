import 'package:flutter/material.dart';
import 'edit_profile_page.dart';
import 'login_page.dart';

class ProfilePage extends StatelessWidget {
  final bool isLoggedIn = true; // ubah ke false untuk test logout

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profil",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: isLoggedIn ? _buildLoggedInUI(context) : _buildLoggedOutUI(context),
    );
  }

  //  UI Jika BELUM LOGIN
  Widget _buildLoggedOutUI(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => LoginPage()),
          );
        },
        child: const Text("Masuk / Daftar"),
      ),
    );
  }

  //  UI Jika SUDAH LOGIN
  Widget _buildLoggedInUI(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        /// Foto Profil + Nama
        Center(
          child: Column(
            children: [
              CircleAvatar(
                radius: 45,
                backgroundColor: Colors.grey[300],
                child: Icon(Icons.person, size: 50, color: Colors.grey[600]),
              ),
              const SizedBox(height: 12),
              const Text(
                "Nama Pengguna",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(
                "@username",
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
            ],
          ),
        ),

        const SizedBox(height: 30),

        /// MENU-MENU
        _menuItem(Icons.shopping_bag_outlined, "Pesanan Saya", () {}),
        _menuItem(Icons.favorite_border, "Favorit", () {}),
        _menuItem(Icons.settings_outlined, "Pengaturan", () {}),

        /// LIHAT PROFIL → EditProfilePage
        _menuItem(Icons.person_outline, "Lihat Profil", () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => EditProfilePage()),
          );
        }),

        _menuItem(Icons.help_outline, "Bantuan", () {}),

        const SizedBox(height: 30),

        /// Logout
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey,
            padding: const EdgeInsets.symmetric(vertical: 12),
          ),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => LoginPage()),
            );
          },
          child: const Text(
            "Logout",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ],
    );
  }

  // Widget menu DENGAN onTap
  Widget _menuItem(IconData icon, String title, VoidCallback onTap) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        onTap: onTap,
        leading: Icon(icon, size: 28),
        title: Text(title, style: const TextStyle(fontSize: 16)),
        trailing: const Icon(Icons.chevron_right),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        tileColor: Colors.grey[200],
      ),
    );
  }
}
