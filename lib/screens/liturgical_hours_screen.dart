import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/locale_provider.dart';
import '../l10n/app_strings.dart';
import '../models/liturgical_hour.dart';
import '../theme/app_theme.dart';

class LiturgicalHoursScreen extends StatelessWidget {
  const LiturgicalHoursScreen({super.key});

  // Données d'exemple — à remplacer par la lecture du canal Telegram
  // dès que le bot/canal seront configurés.
  static final _hours = [
    LiturgicalHour(name: 'Laudes', time: '06:00 - Chapelle', location: 'Chapelle', iconKey: 'sunrise'),
    LiturgicalHour(name: 'Messe', time: '06:30 - Chapelle', location: 'Chapelle', iconKey: 'chalice'),
    LiturgicalHour(name: 'Adoration', time: '08:00 - 12:00 - Chapelle', location: 'Chapelle', iconKey: 'monstrance'),
    LiturgicalHour(name: 'Office du milieu du jour', time: '12:15 - Chapelle', location: 'Chapelle', iconKey: 'sun'),
    LiturgicalHour(name: 'Vêpres', time: '18:30 - Chapelle', location: 'Chapelle', iconKey: 'sunset'),
    LiturgicalHour(name: 'Complies', time: '20:00 - Chapelle', location: 'Chapelle', iconKey: 'moon'),
  ];

  IconData _iconFor(String key) {
    switch (key) {
      case 'sunrise':
        return Icons.wb_twilight;
      case 'chalice':
        return Icons.emoji_food_beverage_outlined;
      case 'monstrance':
        return Icons.brightness_7;
      case 'sun':
        return Icons.wb_sunny_outlined;
      case 'sunset':
        return Icons.nights_stay_outlined;
      case 'moon':
        return Icons.dark_mode_outlined;
      default:
        return Icons.access_time;
    }
  }

  @override
  Widget build(BuildContext context) {
    final s = AppStrings(context.watch<LocaleProvider>().code);
    return Scaffold(
      appBar: AppBar(title: Text(s.t('liturgicalHours'))),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              children: [
                _TabChip(label: s.t('today'), selected: true),
                const SizedBox(width: 8),
                _TabChip(label: s.t('thisWeek'), selected: false),
                const SizedBox(width: 8),
                _TabChip(label: s.t('calendar'), selected: false),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('Mardi 23 septembre 2025',
                  style: const TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('Férie du Temps Ordinaire',
                  style: TextStyle(color: AppColors.grisTexte, fontSize: 12)),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _hours.length,
              itemBuilder: (context, i) {
                final h = _hours[i];
                return Card(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: AppColors.creme,
                      child: Icon(_iconFor(h.iconKey), color: AppColors.bordeaux),
                    ),
                    title: Text(h.name, style: const TextStyle(fontWeight: FontWeight.w600)),
                    subtitle: Text(h.time),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _TabChip extends StatelessWidget {
  final String label;
  final bool selected;
  const _TabChip({required this.label, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label, style: TextStyle(color: selected ? Colors.white : AppColors.texteFonce, fontSize: 12)),
      backgroundColor: selected ? AppColors.bordeaux : AppColors.creme,
    );
  }
}
