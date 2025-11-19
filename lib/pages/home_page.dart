import 'package:flutter/material.dart';
import 'detail_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, 

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: const Text(
          "Villa",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),

      body: Container(
        color: Colors.white, 
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // SEARCH BAR
              TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: "Cari...",
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),

              const SizedBox(height: 20),

              // VERTICAL SCROLL
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildTitle("Villa Populer di Puncak"),
                      buildHorizontalList(context),

                      const SizedBox(height: 25),

                      buildTitle("Tersedia di Bandung pada akhir pekan"),
                      buildHorizontalList(context),

                      const SizedBox(height: 25),

                      buildTitle("Penginapan di Yogyakarta"),
                      buildHorizontalList(context),

                      const SizedBox(height: 25),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // JUDUL KATEGORI
  Widget buildTitle(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.black, // ⬅ pastikan judul hitam
      ),
    );
  }

  // HORIZONTAL LIST
  Widget buildHorizontalList(BuildContext context) {
    return SizedBox(
      height: 160,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: 10,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          return _buildItem(context);
        },
      ),
    );
  }

  // CARD ITEM
  Widget _buildItem(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => DetailPage()),
        );
      },
      child: Container(
        width: 140,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
