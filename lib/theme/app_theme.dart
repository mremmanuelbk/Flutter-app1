import 'package:flutter/material.dart';

/// Palette reprise du Figma : brun foncé / bordeaux + doré sur fond ivoire.
class AppColors {
  static const Color brunFonce = Color(0xFF3B1F13);   // fonds sombres, header
  static const Color bordeaux = Color(0xFF6E2A1E);    // accents, boutons
  static const Color dore = Color(0xFFC9A66B);        // liseré doré
  static const Color doreClair = Color(0xFFD9B673);
  static const Color ivoire = Color(0xFFFBF3E7);      // fond général
  static const Color creme = Color(0xFFF3E6D0);       // cartes
  static const Color texteFonce = Color(0xFF2B1810);
  static const Color texteClair = Color(0xFFFBF3E7);
  static const Color grisTexte = Color(0xFF8A7A6D);
}

class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.ivoire,
      fontFamily: 'Georgia',
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.bordeaux,
        primary: AppColors.bordeaux,
        secondary: AppColors.doreClair,
        surface: AppColors.creme,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.brunFonce,
        foregroundColor: AppColors.texteClair,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: AppColors.texteClair,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      cardTheme: CardThemeData(
        color: AppColors.creme,
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.bordeaux,
          foregroundColor: AppColors.texteClair,
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.ivoire,
        selectedItemColor: AppColors.bordeaux,
        unselectedItemColor: AppColors.grisTexte,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.grisTexte),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      ),
    );
  }
}
