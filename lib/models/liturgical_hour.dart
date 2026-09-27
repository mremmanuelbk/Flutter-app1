class LiturgicalHour {
  final String name;   // ex: Laudes, Messe, Adoration
  final String time;   // ex: "06:00 - Chapelle"
  final String location;
  final String iconKey; // clé pour choisir l'icône dans l'UI

  LiturgicalHour({
    required this.name,
    required this.time,
    required this.location,
    required this.iconKey,
  });
}
