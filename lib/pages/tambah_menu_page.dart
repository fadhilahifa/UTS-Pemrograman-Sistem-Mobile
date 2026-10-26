import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/menu_item.dart';
import '../widgets/custom_widget.dart';

class TambahMenuPage extends StatefulWidget {
  const TambahMenuPage({super.key});

  @override
  State<TambahMenuPage> createState() => _TambahMenuPageState();
}

class _TambahMenuPageState extends State<TambahMenuPage> {
  final _formKey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  final _hargaController = TextEditingController();

  @override
  void dispose() {
    _namaController.dispose();
    _hargaController.dispose();
    super.dispose();
  }

  void _simpanMenu() {
    if (_formKey.currentState!.validate()) {
      Get.back(
        result: MenuItem(
          nama: _namaController.text.trim(),
          harga: int.parse(_hargaController.text.trim()),
        ),
      );
    }
  }

  // Helper untuk mempersingkat dekorasi input field
  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: Color(0xFFFF90BB)),
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFFFC1DA), width: 1.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFFF90BB), width: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF90BB),
        elevation: 0,
        title: const CustomText(
          'Tambah Menu',
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 1. TextFormField Nama Menu
              TextFormField(
                controller: _namaController,
                decoration: _inputDecoration('Nama Menu'),
                validator: (val) =>
                    (val == null || val.trim().isEmpty) ? 'Nama menu tidak boleh kosong' : null,
              ),
              const SizedBox(height: 20),

              // 2. TextFormField Harga Menu
              TextFormField(
                controller: _hargaController,
                keyboardType: TextInputType.number,
                decoration: _inputDecoration('Harga Menu'),
                validator: (val) {
                  if (val == null || val.trim().isEmpty) return 'Harga tidak boleh kosong';
                  if (int.tryParse(val.trim()) == null) return 'Harga harus berupa angka';
                  return null;
                },
              ),
              const SizedBox(height: 28),

              // 3. ElevatedButton Simpan
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF90BB),
                  elevation: 2,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: _simpanMenu,
                child: const CustomText(
                  'Simpan Menu',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}