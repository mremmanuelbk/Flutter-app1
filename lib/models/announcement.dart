class Announcement {
  final String id;
  final String title;
  final String description;
  final DateTime date;
  final String? imageUrl;
  final String category; // ex: Fêtes, Retraites, Communauté

  Announcement({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    this.imageUrl,
    this.category = 'Communauté',
  });

  factory Announcement.fromTelegramMessage(Map<String, dynamic> json) {
    return Announcement(
      id: json['message_id'].toString(),
      title: (json['text'] ?? '').toString().split('\n').first,
      description: (json['text'] ?? '').toString(),
      date: DateTime.fromMillisecondsSinceEpoch((json['date'] ?? 0) * 1000),
      imageUrl: json['photo_url'],
    );
  }
}
