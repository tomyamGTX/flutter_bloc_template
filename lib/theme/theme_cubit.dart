import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system) {
    _loadTheme();
  }
  // Load saved theme on app start
  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final isDark = prefs.getBool('isDarkTheme') ?? false;

    emit(isDark ? ThemeMode.dark : ThemeMode.light);
  }

  // Save theme + update UI
  Future<void> toggleTheme() async {
    final isDark = state == ThemeMode.dark;
    final newTheme = isDark ? ThemeMode.light : ThemeMode.dark;

    emit(newTheme);

    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkTheme', newTheme == ThemeMode.dark);
  }
}
