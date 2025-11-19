import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        automaticallyImplyLeading: false,
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ---------- COVER IMAGE ----------
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.grey.shade300),
            ),

            SizedBox(height: 20),

            // ---------- PROFILE SECTION ----------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  // Foto profil
                  CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.grey.shade400,
                    child: Text(
                      "B",
                      style: TextStyle(fontSize: 28, color: Colors.white),
                    ),
                  ),

                  SizedBox(width: 16),

                  // Nama & info singkat
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 16,
                        width: 140,
                        color: Colors.grey.shade300,
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 12,
                        width: 100,
                        color: Colors.grey.shade300,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 30),

            // ---------- 2 IMAGE PREVIEW ----------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 30),

            // ---------- DESCRIPTION / FACILITIES ----------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: List.generate(
                  5,
                  (index) => Container(
                    margin: EdgeInsets.only(bottom: 12),
                    height: 16,
                    width: double.infinity,
                    color: Colors.grey.shade300,
                  ),
                ),
              ),
            ),

            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
