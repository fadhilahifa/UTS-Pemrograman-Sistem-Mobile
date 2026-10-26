import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Komentar alasan desain:
// Saya menggunakan font poppins agar tampilan teks terlihat lebih modern dan rapih.
// Lalu custom widget ini dibuat agar ukuran, ketebalan teks, dan warna dapat fleksibel saat digunakan pada halaman tampilan.
class CustomText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;

  const CustomText(
    this.text, {
    super.key,
    this.fontSize,
    this.fontWeight,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        fontSize: fontSize ?? 14.0,
        fontWeight: fontWeight ?? FontWeight.normal,
        color: color ?? Colors.black,
      ),
    );
  }
}