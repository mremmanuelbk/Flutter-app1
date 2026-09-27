import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/announcement.dart';

/// Le bot + canal Telegram font office de backend complet :
/// - les demandes de messe sont envoyées au bot (qui les relaie au canal des frères)
/// - les annonces et horaires liturgiques sont publiés dans le canal,
///   puis relus ici via l'API Bot (getUpdates / getChat) ou un relais léger.
///
/// ⚠️ À compléter dès que le token du bot et l'ID du canal sont disponibles.
class TelegramConfig {
  // TODO(Emmanuel): remplacer par les vraies valeurs une fois le bot créé.
  static const String botToken = 'REMPLACER_PAR_LE_TOKEN_DU_BOT';
  static const String announcementsChannelId = '@REMPLACER_PAR_LE_CANAL_ANNONCES';
  static const String massRequestsChatId = '@REMPLACER_PAR_LE_CANAL_OU_GROUPE_MESSES';

  static Uri api(String method) =>
      Uri.parse('https://api.telegram.org/bot$botToken/$method');
}

class TelegramService {
  /// Envoie une demande de messe (ou n'importe quel message formaté) dans le
  /// canal/groupe dédié aux demandes.
  static Future<bool> sendMessage(String text, {String? chatId}) async {
    try {
      final response = await http.post(
        TelegramConfig.api('sendMessage'),
        body: {
          'chat_id': chatId ?? TelegramConfig.massRequestsChatId,
          'text': text,
          'parse_mode': 'Markdown',
        },
      );
      final data = jsonDecode(response.body);
      return data['ok'] == true;
    } catch (_) {
      return false;
    }
  }

  /// Récupère les derniers messages du canal d'annonces.
  /// NB: `getUpdates` ne renvoie que les messages reçus depuis que le bot
  /// écoute — pour un historique complet côté canal, prévoir soit un relais
  /// (petit worker qui archive les messages dans une base légère), soit
  /// l'API `getChatHistory` d'un client MTProto si besoin d'aller plus loin.
  static Future<List<Announcement>> fetchAnnouncements() async {
    try {
      final response = await http.get(TelegramConfig.api('getUpdates'));
      final data = jsonDecode(response.body);
      if (data['ok'] != true) return [];
      final List updates = data['result'];
      return updates
          .where((u) => u['channel_post'] != null)
          .map((u) => Announcement.fromTelegramMessage(u['channel_post']))
          .toList()
          .cast<Announcement>();
    } catch (_) {
      return [];
    }
  }
}
