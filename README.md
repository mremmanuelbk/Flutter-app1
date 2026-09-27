# Carmel Akodésséwa — App Flutter

Application mobile de la Communauté des Frères Carmes Déchaux d'Akodésséwa
(Maison de Formation). Android + iOS, bilingue Français / Éwé.

## Structure du projet

```
lib/
  main.dart                     point d'entrée
  theme/app_theme.dart          couleurs & thème (repris du Figma)
  l10n/app_strings.dart         dictionnaire FR / Éwé
  providers/locale_provider.dart   langue choisie, sauvegardée localement
  services/telegram_service.dart   backend = bot + canal Telegram
  models/                       Announcement, LiturgicalHour, MassRequest, AgendaItem, CommunityLink
  screens/
    splash_screen.dart          écran de chargement
    language_selection_screen.dart  choix Français / Éwé
    main_shell.dart             barre de navigation (Accueil/Liturgie/Messe/Annonces/Plus)
    home_screen.dart
    liturgical_hours_screen.dart
    mass_request_screen.dart    formulaire → envoyé au bot Telegram
    announcements_screen.dart   lit les annonces depuis le canal Telegram
    prayers_screen.dart
    brother_space_screen.dart   agenda du frère
    more_screen.dart            menu "Plus"
    community_life_screen.dart  planning, formations, documents, contacts...
```

## Pour démarrer

```bash
flutter pub get
flutter run
```

## Configurer le backend Telegram (obligatoire)

Le bot + canal Telegram servent de backend complet :
- le formulaire **Demande de messe** envoie un message formaté au bot,
  qui le relaie vers le canal/groupe des frères ;
- l'écran **Annonces** lit les messages du canal.

1. Crée un bot avec **@BotFather** sur Telegram → récupère le **token**.
2. Crée le canal ou groupe des annonces, ajoute le bot comme administrateur,
   récupère son **chat_id** (ou son `@nom_du_canal` s'il est public).
3. Fais de même pour le canal/groupe des demandes de messe (peut être le même).
4. Renseigne les trois valeurs dans `lib/services/telegram_service.dart` :

```dart
static const String botToken = '...';
static const String announcementsChannelId = '@...';
static const String massRequestsChatId = '@...';
```

⚠️ `getUpdates` ne renvoie que les messages reçus **depuis que le bot écoute**.
Pour un historique complet des annonces dès le premier lancement, il faudra
soit archiver les messages côté serveur (petit worker), soit passer par un
webhook. Non bloquant pour démarrer, mais à prévoir avant mise en production.

## Prochaines étapes

- [ ] Cahier des charges détaillé (règles métier précises de chaque écran)
- [ ] Token du bot Telegram + IDs des canaux
- [ ] Logo en haute résolution / déclinaisons pour l'icône de l'app
- [ ] Police exacte du Figma (actuellement : Georgia par défaut, en attente
      de confirmation de la police utilisée dans la maquette)
- [ ] Nom de package définitif (actuellement générique, voir `android/app/build.gradle`
      et `ios/Runner.xcodeproj`)
