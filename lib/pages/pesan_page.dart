import 'package:flutter/material.dart';
import 'chat_room_page.dart';

class PesanPage extends StatelessWidget {
  const PesanPage({super.key});

  final List<Map<String, dynamic>> chats = const [
    {"name": "Alfan", "message": "Oke siap!", "unread": 2},
    {"name": "Danang", "message": "Barang masih ada?", "unread": 0},
    {"name": "Rafi", "message": "Terima kasih", "unread": 1},
    {"name": "Adam", "message": "Siap dikirim ya", "unread": 0},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),

              Row(
                children: [
                  _filterButton("Semua", selected: true),
                  SizedBox(width: 8),
                  _filterButton("Belum dibaca"),
                  SizedBox(width: 8),
                  _filterButton("Selesai"),
                ],
              ),

              const SizedBox(height: 25),

              Expanded(
                child: ListView.builder(
                  itemCount: chats.length,
                  itemBuilder: (context, index) {
                    final chat = chats[index];
                    return _chatTile(
                      context,
                      chat["name"],
                      chat["message"],
                      chat["unread"],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _chatTile(BuildContext context, String name, String message, int unread) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ChatRoomPage(name: name),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            // Avatar 
            CircleAvatar(
              radius: 22,
              backgroundColor: Colors.grey,
              child: Text(
                name[0],
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),

            SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(height: 3),
                  Text(message, style: TextStyle(color: Colors.black54)),
                ],
              ),
            ),

            if (unread > 0)
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  unread.toString(),
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _filterButton(String text, {bool selected = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: selected ? Colors.black : Colors.grey[300],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: selected ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
