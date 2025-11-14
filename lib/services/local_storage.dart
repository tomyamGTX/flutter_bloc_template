import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  final SharedPreferences prefs;

  LocalStorageService(this.prefs);

  Future<void> saveTheme(bool isDark) async {
    await prefs.setBool("is_dark", isDark);
  }

  bool loadTheme() => prefs.getBool("is_dark") ?? false;
}
