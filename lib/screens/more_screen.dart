import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/locale_provider.dart';
import '../l10n/app_strings.dart';
import '../theme/app_theme.dart';
import 'prayers_screen.dart';
import 'brother_space_screen.dart';
import 'community_life_screen.dart';
import 'language_selection_screen.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final s = AppStrings(context.watch<LocaleProvider>().code);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carmel Akodésséwa'),
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: AppColors.brunFonce,
                  child: Icon(Icons.shield, color: AppColors.doreClair),
                ),
                SizedBox(height: 8),
                Text('Carmel Akodésséwa', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('Maison de Formation', style: TextStyle(fontSize: 12, color: AppColors.grisTexte)),
              ],
            ),
          ),
          const SizedBox(height: 20),
          _MenuTile(icon: Icons.home_outlined, label: s.t('home'), onTap: () {}),
          _MenuTile(icon: Icons.menu_book_outlined, label: s.t('liturgy'), onTap: () {}),
          _MenuTile(icon: Icons.local_florist_outlined, label: s.t('massRequest'), onTap: () {}),
          _MenuTile(icon: Icons.campaign_outlined, label: s.t('announcements'), onTap: () {}),
          _MenuTile(icon: Icons.favorite_border, label: s.t('prayers'),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const PrayersScreen()))),
          _MenuTile(icon: Icons.person_outline, label: s.t('brotherSpace'),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const BrotherSpaceScreen()))),
          _MenuTile(icon: Icons.groups_outlined, label: s.t('communityLife'),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CommunityLifeScreen()))),
          const SizedBox(height: 20),
          OutlinedButton.icon(
            onPressed: () async {
              await context.read<LocaleProvider>().setLanguage(context.read<LocaleProvider>().code);
              if (!context.mounted) return;
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const LanguageSelectionScreen()),
                (route) => false,
              );
            },
            icon: const Icon(Icons.logout, color: AppColors.bordeaux),
            label: Text(s.t('logout'), style: const TextStyle(color: AppColors.bordeaux)),
          ),
        ],
      ),
    );
  }
}

class _MenuTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _MenuTile({required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Icon(icon, color: AppColors.bordeaux),
        title: Text(label),
        trailing: const Icon(Icons.chevron_right, size: 18),
        onTap: onTap,
      ),
    );
  }
}
