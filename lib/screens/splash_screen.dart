import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/locale_provider.dart';
import '../theme/app_theme.dart';
import 'language_selection_screen.dart';
import 'main_shell.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    final localeProvider = context.read<LocaleProvider>();
    await localeProvider.load();
    await Future.delayed(const Duration(milliseconds: 1200));
    if (!mounted) return;

    // Si une langue a déjà été choisie précédemment, on va directement à
    // l'accueil ; sinon on propose l'écran de choix de langue (comme sur le Figma).
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => localeProvider.hasChosen
            ? const MainShell()
            : const LanguageSelectionScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.brunFonce, Color(0xFF1E0F08)],
        ),
      ),
      child: const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 48,
              backgroundColor: AppColors.doreClair,
              child: Icon(Icons.shield, size: 46, color: AppColors.brunFonce),
            ),
            SizedBox(height: 18),
            Text(
              'CARMEL AKODÉSSÉWA',
              style: TextStyle(
                color: AppColors.texteClair,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Communauté des Carmes Déchaux\nMaison de Formation',
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColors.doreClair, fontSize: 13),
            ),
            SizedBox(height: 30),
            CircularProgressIndicator(color: AppColors.doreClair),
          ],
        ),
      ),
    );
  }
}
