import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/locale_provider.dart';
import '../l10n/app_strings.dart';
import '../models/agenda_item.dart';
import '../theme/app_theme.dart';

class BrotherSpaceScreen extends StatelessWidget {
  const BrotherSpaceScreen({super.key});

  static final _agenda = [
    AgendaItem(time: '06:00', title: 'Laudes', subtitle: 'Chapelle'),
    AgendaItem(time: '07:30', title: 'Petit-déjeuner', subtitle: 'Réfectoire'),
    AgendaItem(time: '08:00', title: 'Cours de théologie', subtitle: 'Salle de cours'),
    AgendaItem(time: '11:00', title: 'Entretien personnel', subtitle: 'Cellule'),
    AgendaItem(time: '13:00', title: 'Étude', subtitle: 'Bibliothèque'),
    AgendaItem(time: '15:00', title: 'Sport', subtitle: 'Terrain'),
    AgendaItem(time: '18:30', title: 'Vêpres', subtitle: 'Chapelle'),
    AgendaItem(time: '19:30', title: 'Réunion communautaire', subtitle: 'Salle capitulaire'),
  ];

  @override
  Widget build(BuildContext context) {
    final s = AppStrings(context.watch<LocaleProvider>().code);
    return Scaffold(
      appBar: AppBar(title: Text(s.t('brotherSpace'))),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                CircleAvatar(backgroundColor: AppColors.creme, child: Icon(Icons.person, color: AppColors.bordeaux)),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Fr. Pascal', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('En formation', style: TextStyle(fontSize: 12, color: AppColors.grisTexte)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('Mardi 23 septembre 2025', style: TextStyle(fontWeight: FontWeight.w600)),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _agenda.length,
              itemBuilder: (context, i) {
                final item = _agenda[i];
                return ListTile(
                  leading: SizedBox(width: 46, child: Text(item.time, style: const TextStyle(fontWeight: FontWeight.w600))),
                  title: Text(item.title),
                  subtitle: item.subtitle != null ? Text(item.subtitle!) : null,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
