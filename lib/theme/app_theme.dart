import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primaryGold = Color(0xFFDAA520);
  static const Color secondaryGold = Color(0xFFCFB53B);
  static const Color darkBlack = Color(0xFF000000);
  static const Color softBlack = Color(0xFF1A1A1A);
  static const Color white = Color(0xFFFFFFFF);

  static ThemeData theme = ThemeData(
    primaryColor: primaryGold,
    scaffoldBackgroundColor: darkBlack,
    appBarTheme: const AppBarTheme(
      backgroundColor: darkBlack,
      elevation: 0,
      iconTheme: IconThemeData(color: primaryGold),
      titleTextStyle: TextStyle(
        color: primaryGold,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.playfairDisplay(
        color: white,
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: GoogleFonts.playfairDisplay(
        color: white,
        fontSize: 24,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: GoogleFonts.lato(
        color: white,
        fontSize: 16,
      ),
      bodyMedium: GoogleFonts.lato(
        color: white,
        fontSize: 14,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryGold,
        foregroundColor: darkBlack,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: softBlack,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: primaryGold),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: primaryGold),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: secondaryGold, width: 2),
      ),
      labelStyle: const TextStyle(color: primaryGold),
    ),
  );
}
