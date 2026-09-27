import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/locale_provider.dart';
import '../theme/app_theme.dart';
import 'main_shell.dart';

class LanguageSelectionScreen extends StatelessWidget {
  const LanguageSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.ivoire,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 44,
                backgroundColor: AppColors.brunFonce,
                child: Icon(Icons.shield, size: 40, color: AppColors.doreClair),
              ),
              const SizedBox(height: 20),
              const Text(
                'CARMEL AKODÉSSÉWA',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.texteFonce,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Communauté des Carmes Déchaux\nMaison de Formation',
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.grisTexte, fontSize: 13),
              ),
              const SizedBox(height: 36),
              const Text(
                'Choisissez votre langue',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
              const Text(
                'Bɖidɖi dé woe',
                style: TextStyle(fontSize: 13, color: AppColors.grisTexte),
              ),
              const SizedBox(height: 28),
              _LanguageButton(
                label: 'Français',
                code: 'fr',
                onTap: () => _select(context, 'fr'),
              ),
              const SizedBox(height: 14),
              _LanguageButton(
                label: 'Èʋegbe (éwé)',
                code: 'ee',
                onTap: () => _select(context, 'ee'),
              ),
              const SizedBox(height: 30),
              const Text(
                '✝  Ensemble sur le chemin du Christ',
                style: TextStyle(color: AppColors.grisTexte, fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _select(BuildContext context, String code) async {
    await context.read<LocaleProvider>().setLanguage(code);
    if (!context.mounted) return;
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const MainShell()),
    );
  }
}

class _LanguageButton extends StatelessWidget {
  final String label;
  final String code;
  final VoidCallback onTap;

  const _LanguageButton({required this.label, required this.code, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.brunFonce,
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
        child: Text(label, style: const TextStyle(fontSize: 15)),
      ),
    );
  }
}
