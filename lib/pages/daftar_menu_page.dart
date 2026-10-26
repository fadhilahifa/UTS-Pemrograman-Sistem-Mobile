import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/menu_item.dart';
import '../widgets/custom_widget.dart';
import 'detail_menu_page.dart';
import 'tambah_menu_page.dart';

class DaftarMenuPage extends StatefulWidget {
  const DaftarMenuPage({super.key});

  @override
  State<DaftarMenuPage> createState() => _DaftarMenuPageState();
}

class _DaftarMenuPageState extends State<DaftarMenuPage> {
  final List<MenuItem> menuList = [
    MenuItem(nama: 'Nasi Goreng Terasi', harga: 15000),
    MenuItem(nama: 'Ayam Geprek Sambal Matah', harga: 18000),
    MenuItem(nama: 'Mie Ayam Ceker', harga: 13000),
    MenuItem(nama: 'Es Campur', harga: 12000),
    MenuItem(nama: 'Jus Mangga', harga: 10000),
    MenuItem(nama: 'Chicken Katsu Teriyaki', harga: 19000),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, 
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF90BB),
        title: const CustomText(
          'Kantinote',
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: const CustomText(
              'Daftar Menu Makanan',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFFFF90BB),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: menuList.length,
              itemBuilder: (context, index) {
                final item = menuList[index];
                return Card(
                  color: const Color(0xFFF8F8E1), // Card warna krem
                  margin: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 6,
                  ),
                  elevation: 1,
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12, 
                    ),
                    leading: const CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.fastfood_rounded,
                        color: Color(0xFFFF90BB),
                      ),// Icon abu-abu
                    ),
                    title: CustomText(
                      item.nama,
                      fontWeight: FontWeight.bold, 
                      fontSize: 15,
                      color: Colors.black87,
                    ),
                    subtitle: CustomText(
                      'Rp ${item.harga}',
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: const Color.fromARGB(255, 134, 222, 137),
                    ),
                    trailing: const Icon(
                      Icons.chevron_right,
                      color: Colors.grey, 
                    ),
                    onTap: () {
                      Get.to(() => DetailMenuPage(item: item));
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFFF90BB),
        onPressed: () async {
          final newMenu = await Get.to(() => const TambahMenuPage());
          if (newMenu != null) {
            setState(() {
              menuList.add(newMenu);
            });
          }
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}