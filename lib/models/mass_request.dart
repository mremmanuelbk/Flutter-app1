class MassRequest {
  final String intentionType; // Défunt, Action de grâce, etc.
  final String requesterName;
  final String phone;
  final String personName;
  final DateTime? preferredDate;
  final String? message;

  MassRequest({
    required this.intentionType,
    required this.requesterName,
    required this.phone,
    required this.personName,
    this.preferredDate,
    this.message,
  });

  String toTelegramText() {
    final buffer = StringBuffer()
      ..writeln('📩 *Nouvelle demande de messe*')
      ..writeln("Type d'intention : $intentionType")
      ..writeln('Demandeur : $requesterName')
      ..writeln('Téléphone : $phone')
      ..writeln('Pour : $personName');
    if (preferredDate != null) {
      buffer.writeln('Date souhaitée : ${preferredDate!.toLocal()}'.split('.').first);
    }
    if (message != null && message!.trim().isNotEmpty) {
      buffer.writeln('Message : $message');
    }
    return buffer.toString();
  }
}
