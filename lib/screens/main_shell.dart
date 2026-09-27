import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/locale_provider.dart';
import '../l10n/app_strings.dart';
import 'home_screen.dart';
import 'liturgical_hours_screen.dart';
import 'mass_request_screen.dart';
import 'announcements_screen.dart';
import 'more_screen.dart';

/// Coquille avec les 5 onglets vus sur l'écran d'accueil du Figma :
/// Accueil / Liturgie / Messe / Annonces / Plus.
class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _index = 0;

  static const _screens = [
    HomeScreen(),
    LiturgicalHoursScreen(),
    MassRequestScreen(),
    AnnouncementsScreen(),
    MoreScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final s = AppStrings(context.watch<LocaleProvider>().code);
    return Scaffold(
      body: IndexedStack(index: _index, children: _screens),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
        items: [
          BottomNavigationBarItem(icon: const Icon(Icons.home_outlined), label: s.t('home')),
          BottomNavigationBarItem(icon: const Icon(Icons.church_outlined), label: s.t('liturgy')),
          BottomNavigationBarItem(icon: const Icon(Icons.local_florist_outlined), label: s.t('mass')),
          BottomNavigationBarItem(icon: const Icon(Icons.campaign_outlined), label: s.t('announcements')),
          BottomNavigationBarItem(icon: const Icon(Icons.more_horiz), label: s.t('more')),
        ],
      ),
    );
  }
}
