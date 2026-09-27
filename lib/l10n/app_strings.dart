/// Dictionnaire simple FR / Éwé (bɖidɖi dé woe).
/// À compléter au fil du cahier des charges — structure volontairement plate
/// pour rester facile à modifier sans regénérer de fichiers .arb.
class AppStrings {
  final String code; // 'fr' ou 'ee'
  AppStrings(this.code);

  static const Map<String, Map<String, String>> _dict = {
    'chooseLanguage': {
      'fr': 'Choisissez votre langue',
      'ee': 'Tia wò gbe',
    },
    'french': {'fr': 'Français', 'ee': 'Fransegbe'},
    'ewe': {'fr': 'Éwé', 'ee': 'Èʋegbe'},
    'home': {'fr': 'Accueil', 'ee': 'Aƒeme'},
    'liturgy': {'fr': 'Liturgie', 'ee': 'Subɔsubɔ'},
    'mass': {'fr': 'Messe', 'ee': 'Missa'},
    'announcements': {'fr': 'Annonces', 'ee': 'Gbeƒãɖeɖewo'},
    'more': {'fr': 'Plus', 'ee': 'Bubuwo'},
    'agenda': {'fr': 'Agenda', 'ee': 'Ɣeyiɣiɖoɖo'},
    'messages': {'fr': 'Messages', 'ee': 'Gbedeasiwo'},
    'nextMass': {'fr': 'Prochaine messe', 'ee': 'Missa si gbɔna'},
    'recentAnnouncements': {'fr': 'Annonces récentes', 'ee': 'Gbeƒãɖeɖe yeyewo'},
    'seeAll': {'fr': 'Voir tout', 'ee': 'Kpɔ wo katã'},
    'liturgicalHours': {'fr': 'Horaires liturgiques', 'ee': 'Subɔsubɔ ɣeyiɣiwo'},
    'today': {'fr': "Aujourd'hui", 'ee': 'Egbe'},
    'thisWeek': {'fr': 'Cette semaine', 'ee': 'Kwasiɖa sia'},
    'calendar': {'fr': 'Calendrier', 'ee': 'Ŋkekenyawo'},
    'massRequest': {'fr': 'Demande de messe', 'ee': 'Missa ƒe biabia'},
    'intentionType': {'fr': "Type d'intention", 'ee': 'Taɖodzinu ƒomevi'},
    'deceased': {'fr': 'Défunt', 'ee': 'Kutɔ'},
    'requesterName': {'fr': 'Nom du demandeur', 'ee': 'Biala ƒe ŋkɔ'},
    'phone': {'fr': 'Téléphone', 'ee': 'Kaƒoƒomɔ'},
    'personName': {'fr': 'Nom de la personne pour laquelle la messe est demandée', 'ee': 'Ame si ŋu biabia ku ɖo la ƒe ŋkɔ'},
    'preferredDate': {'fr': 'Date souhaitée (facultative)', 'ee': 'Ŋkeke si dim (mehiã o)'},
    'message': {'fr': 'Message (facultatif)', 'ee': 'Gbedeasi (mehiã o)'},
    'sendRequest': {'fr': 'Envoyer la demande', 'ee': 'Ɖo biabia ɖa'},
    'prayers': {'fr': 'Prier', 'ee': 'Gbedodoɖa'},
    'dailyPrayers': {'fr': 'Prières du jour', 'ee': 'Egbe ƒe gbedodoɖawo'},
    'novenas': {'fr': 'Neuvaines', 'ee': 'Ŋkekeasieke gbedodoɖawo'},
    'brotherSpace': {'fr': 'Espace Frère', 'ee': 'Nɔviŋutsu ƒe nɔƒe'},
    'communityLife': {'fr': 'Vie communautaire', 'ee': 'Habɔbɔ ƒe agbenɔnɔ'},
    'planning': {'fr': 'Planning communautaire', 'ee': 'Habɔbɔ ƒe ɖoɖo'},
    'brothers': {'fr': 'Frères de la communauté', 'ee': 'Habɔbɔ ƒe nɔviwo'},
    'formations': {'fr': 'Formations', 'ee': 'Hehewo'},
    'usefulDocuments': {'fr': 'Documents utiles', 'ee': 'Agbalẽ vevowo'},
    'spiritualResources': {'fr': 'Ressources spirituelles', 'ee': 'Gbɔgbɔ me nunɔamesiwo'},
    'contacts': {'fr': 'Contacts', 'ee': 'Kadodowo'},
    'logout': {'fr': 'Déconnexion', 'ee': 'Dodo le eme'},
    'loading': {'fr': 'Chargement...', 'ee': 'Ele nu wɔm...'},
    'sentSuccess': {'fr': 'Votre demande a bien été envoyée.', 'ee': 'Woɖo wò biabia ɖa nyuie.'},
    'sendError': {'fr': "Échec de l'envoi. Réessayez.", 'ee': 'Ɖoɖo la mewɔ dɔ o. Gadze edzi.'},
    'required': {'fr': 'Champ requis', 'ee': 'Ele be nàyi eme'},
  };

  String t(String key) => _dict[key]?[code] ?? _dict[key]?['fr'] ?? key;
}
