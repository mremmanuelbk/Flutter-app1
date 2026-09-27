import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/locale_provider.dart';
import '../l10n/app_strings.dart';
import '../models/announcement.dart';
import '../services/telegram_service.dart';
import '../theme/app_theme.dart';

class AnnouncementsScreen extends StatefulWidget {
  const AnnouncementsScreen({super.key});

  @override
  State<AnnouncementsScreen> createState() => _AnnouncementsScreenState();
}

class _AnnouncementsScreenState extends State<AnnouncementsScreen> {
  List<Announcement> _items = [];
  bool _loading = true;

  // Données d'exemple tant que le canal Telegram n'est pas branché.
  static final _fallback = [
    Announcement(
      id: '1',
      title: 'Retraite spirituelle des jeunes',
      description: 'Du 19 au 12 octobre\nMaison de formation',
      date: DateTime(2025, 9, 22),
    ),
    Announcement(
      id: '2',
      title: "Fête de la Sainte Thérèse d'Avila",
      description: 'Communauté',
      date: DateTime(2025, 9, 20),
    ),
    Announcement(
      id: '3',
      title: 'Collecte pour les plus démunis',
      description: 'Du dimanche 20 septembre\nParoisse Saint Louis de Gonzague',
      date: DateTime(2025, 9, 18),
    ),
    Announcement(
      id: '4',
      title: 'Inscription au catéchisme',
      description: 'Fin des inscriptions le vendredi\nSecrétariat pastoral',
      date: DateTime(2025, 9, 15),
    ),
    Announcement(
      id: '5',
      title: 'Visite pastorale de notre évêque',
      description: 'Du 5 au 6 octobre\nParoisse Saint Louis de Gonzague',
      date: DateTime(2025, 9, 10),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final remote = await TelegramService.fetchAnnouncements();
    setState(() {
      _items = remote.isNotEmpty ? remote : _fallback;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final s = AppStrings(context.watch<LocaleProvider>().code);
    return Scaffold(
      appBar: AppBar(title: Text(s.t('announcements'))),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: _load,
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: _items.length,
                itemBuilder: (context, i) {
                  final a = _items[i];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: AppColors.creme,
                        child: Icon(Icons.campaign_outlined, color: AppColors.bordeaux),
                      ),
                      title: Text(a.title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                      subtitle: Text(a.description, style: const TextStyle(fontSize: 12)),
                      isThreeLine: a.description.contains('\n'),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
