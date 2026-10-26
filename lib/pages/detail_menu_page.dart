import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/menu_item.dart';
import '../widgets/custom_widget.dart';

class DetailMenuPage extends StatelessWidget {
  final MenuItem item;

  const DetailMenuPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF90BB),
        elevation: 0,
        title: const CustomText(
          'Detail Menu',
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Container Placeholder Gambar dengan Efek Melayang
            Container(
              width: double.infinity,
              height: 210,
              margin: const EdgeInsets.only(bottom: 24, top: 4),
              decoration: BoxDecoration(
                color: const Color(0xFFF8F8E1),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.grey.shade300,
                  width: 1.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.10),
                    blurRadius: 20,
                    spreadRadius: 1,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: const Icon(
                Icons.image_outlined,
                size: 80,
                color: Colors.grey,
              ),
            ),

            // Nama Menu
            CustomText(
              item.nama,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            const SizedBox(height: 8),

            // Tag Kategori
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFFFFC1DA),
                borderRadius: BorderRadius.circular(6),
              ),
              child: const CustomText(
                'Menu Kantin',
                fontSize: 12,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),

            // Harga Menu
            CustomText(
              'Rp ${item.harga}',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
            const SizedBox(height: 8),

            // Status Stok
            const Row(
              children: [
                CustomText(
                  'Status Stok: ',
                  fontSize: 14,
                  color: Colors.black87,
                ),
                CustomText(
                  'Tersedia',
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFF90BB),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Divider(color: Colors.black12, thickness: 1),
            const SizedBox(height: 12),

            // Judul Deskripsi
            const CustomText(
              'Deskripsi Menu',
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            const SizedBox(height: 8),

            // Isi Deskripsi
            const CustomText(
              'Menu favorit khas kantin yang disajikan lezat, hangat, dan dibuat menggunakan bahan-bahan berkualitas setiap harinya.',
              fontSize: 14,
              color: Colors.black54,
            ),
          ],
        ),
      ),
    );
  }
}