import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/locale_provider.dart';
import '../l10n/app_strings.dart';
import '../theme/app_theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final s = AppStrings(context.watch<LocaleProvider>().code);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 190,
            pinned: true,
            backgroundColor: AppColors.brunFonce,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [AppColors.brunFonce, Color(0xFF1E0F08)],
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const CircleAvatar(
                        radius: 32,
                        backgroundColor: AppColors.doreClair,
                        child: Icon(Icons.shield, color: AppColors.brunFonce, size: 30),
                      ),
                      const SizedBox(height: 8),
                      const Text('« Tout pour Jésus, par Marie »',
                          style: TextStyle(color: AppColors.doreClair, fontSize: 12, fontStyle: FontStyle.italic)),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _NextMassCard(s: s),
                  const SizedBox(height: 22),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(s.t('recentAnnouncements'),
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      TextButton(onPressed: () {}, child: Text(s.t('seeAll'))),
                    ],
                  ),
                  const _AnnouncementPreview(
                    title: 'Retraite spirituelle des jeunes',
                    date: '22 septembre 2025',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _NextMassCard extends StatelessWidget {
  final AppStrings s;
  const _NextMassCard({required this.s});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            const Icon(Icons.church, color: AppColors.bordeaux, size: 30),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(s.t('nextMass'), style: const TextStyle(color: AppColors.grisTexte, fontSize: 12)),
                  const SizedBox(height: 2),
                  const Text('Mardi 23 septembre 2025',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  const Text('06:30 - Chapelle', style: TextStyle(fontSize: 13)),
                ],
              ),
            ),
            TextButton(onPressed: () {}, child: Text(s.t('seeAll'))),
          ],
        ),
      ),
    );
  }
}

class _AnnouncementPreview extends StatelessWidget {
  final String title;
  final String date;
  const _AnnouncementPreview({required this.title, required this.date});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 10),
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: AppColors.creme,
          child: Icon(Icons.campaign_outlined, color: AppColors.bordeaux),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
        subtitle: Text(date, style: const TextStyle(fontSize: 12)),
      ),
    );
  }
}
