import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/locale_provider.dart';
import '../l10n/app_strings.dart';
import '../theme/app_theme.dart';

class PrayersScreen extends StatelessWidget {
  const PrayersScreen({super.key});

  static const _prayers = [
    'Notre Père',
    'Je vous salue Marie',
    'Gloire au Père',
    'Acte de contrition',
    'Prière du Carmel',
    'Chemin de croix',
    'Prière pour les vocations',
  ];

  @override
  Widget build(BuildContext context) {
    final s = AppStrings(context.watch<LocaleProvider>().code);
    return Scaffold(
      appBar: AppBar(title: Text(s.t('prayers'))),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              '« Priez sans vous lasser. »\nLuc 18:1',
              textAlign: TextAlign.center,
              style: TextStyle(fontStyle: FontStyle.italic, color: AppColors.grisTexte),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _prayers.length,
              itemBuilder: (context, i) => Card(
                margin: const EdgeInsets.only(bottom: 10),
                child: ListTile(
                  leading: const Icon(Icons.favorite_border, color: AppColors.bordeaux),
                  title: Text(_prayers[i]),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {},
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
