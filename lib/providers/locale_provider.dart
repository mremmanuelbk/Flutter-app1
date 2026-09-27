import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleProvider extends ChangeNotifier {
  static const _prefsKey = 'app_language_code';
  static const _chosenKey = 'app_language_chosen';
  String _code = 'fr';
  bool _hasChosen = false;

  String get code => _code;
  bool get hasChosen => _hasChosen;

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    _code = prefs.getString(_prefsKey) ?? 'fr';
    _hasChosen = prefs.getBool(_chosenKey) ?? false;
    notifyListeners();
  }

  Future<void> setLanguage(String code) async {
    _code = code;
    _hasChosen = true;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_prefsKey, code);
    await prefs.setBool(_chosenKey, true);
    notifyListeners();
  }
}
