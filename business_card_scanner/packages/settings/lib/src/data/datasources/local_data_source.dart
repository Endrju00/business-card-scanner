import 'dart:ui';

import 'package:core/errors.dart';
import 'package:core/secure_storage.dart';

abstract class ISettingsLocalDataSource {
  Future<Locale> getLocale();

  Future<void> saveLocale(Locale locale);
}

class SettingsLocalDataSource implements ISettingsLocalDataSource {
  final FlutterSecureStorage storage;

  SettingsLocalDataSource({
    required this.storage,
  });

  static const String localeKey = 'locale';

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
}
