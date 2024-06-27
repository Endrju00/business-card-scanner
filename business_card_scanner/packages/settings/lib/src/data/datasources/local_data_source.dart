import 'dart:convert';
import 'dart:ui';

import 'package:core/errors.dart';
import 'package:core/secure_storage.dart';

import '../models/theme_preferences_model.dart';

abstract class ISettingsLocalDataSource {
  Future<Locale> getLocale();

  Future<void> saveLocale(Locale locale);

  Future<ThemePreferencesModel> getThemePreferences();

  Future<void> saveThemePreferences(ThemePreferencesModel themePreferences);
}

class SettingsLocalDataSource implements ISettingsLocalDataSource {
  final FlutterSecureStorage storage;

  SettingsLocalDataSource({
    required this.storage,
  });

  static const String localeKey = 'locale';

  static const String themeKey = 'theme';

  @override
  Future<Locale> getLocale() async {
    final languageCode = await storage.read(key: localeKey);
    if (languageCode == null) throw CacheException();
    return Locale(languageCode);
  }

  @override
  Future<void> saveLocale(Locale locale) async {
    return await storage.write(key: localeKey, value: locale.languageCode);
  }

  @override
  Future<ThemePreferencesModel> getThemePreferences() async {
    final themeData = await storage.read(key: themeKey);
    if (themeData == null) throw CacheException();
    return ThemePreferencesModel.fromJson(json.decode(themeData));
  }

  @override
  Future<void> saveThemePreferences(
    ThemePreferencesModel themePreferences,
  ) async {
    return await storage.write(
        key: themeKey, value: json.encode(themePreferences.toJson()));
  }
}
