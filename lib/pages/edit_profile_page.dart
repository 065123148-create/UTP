import 'package:flutter/material.dart';

class EditProfilePage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController(
    text: "Nama Pengguna",
  );
  final TextEditingController usernameController = TextEditingController(
    text: "@username",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profil"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // FOTO PROFIL
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey[300],
                child: Icon(Icons.person, size: 60, color: Colors.grey[600]),
              ),
            ),

            SizedBox(height: 30),

            // FORM EDIT
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: "Nama",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 20),

            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: "Username",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 30),

            // BUTTON SIMPAN
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                backgroundColor: Colors.grey,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Simpan", style: TextStyle(color: Colors.white, fontSize: 16),),
            ),
          ],
        ),
      ),
    );
  }
}
