import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/locale_provider.dart';
import '../l10n/app_strings.dart';
import '../models/community_link.dart';
import '../theme/app_theme.dart';

class CommunityLifeScreen extends StatelessWidget {
  const CommunityLifeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final s = AppStrings(context.watch<LocaleProvider>().code);
    final links = [
      CommunityLink(label: s.t('planning'), iconKey: 'calendar', routeKey: 'planning'),
      CommunityLink(label: s.t('brothers'), iconKey: 'group', routeKey: 'brothers'),
      CommunityLink(label: s.t('formations'), iconKey: 'school', routeKey: 'formations'),
      CommunityLink(label: s.t('usefulDocuments'), iconKey: 'file', routeKey: 'documents'),
      CommunityLink(label: s.t('spiritualResources'), iconKey: 'book', routeKey: 'resources'),
      CommunityLink(label: s.t('contacts'), iconKey: 'phone', routeKey: 'contacts'),
    ];

    IconData iconFor(String key) {
      switch (key) {
        case 'calendar': return Icons.calendar_month_outlined;
        case 'group': return Icons.groups_outlined;
        case 'school': return Icons.school_outlined;
        case 'file': return Icons.description_outlined;
        case 'book': return Icons.menu_book_outlined;
        case 'phone': return Icons.call_outlined;
        default: return Icons.circle;
      }
    }

    return Scaffold(
      appBar: AppBar(title: Text(s.t('communityLife'))),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 1.5,
              children: links.map((l) {
                return Card(
                  child: InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(14),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(iconFor(l.iconKey), color: AppColors.bordeaux, size: 26),
                          const SizedBox(height: 8),
                          Text(l.label, textAlign: TextAlign.center, style: const TextStyle(fontSize: 12)),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          const Spacer(),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.brunFonce,
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Text(
              '« Ensemble, nous cherchons Dieu et nous servons l\'Église. »',
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColors.texteClair, fontStyle: FontStyle.italic),
            ),
          ),
        ],
      ),
    );
  }
}
