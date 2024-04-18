import 'dart:ui';

import 'package:core/errors.dart';
import 'package:core/secure_storage.dart';

abstract class ILocalDataSource {
  Future<Locale> getLocale();

  Future<void> saveLocale(Locale locale);
}

class LocalDataSource implements ILocalDataSource {
  final FlutterSecureStorage storage;

  LocalDataSource({
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
  Future<void> saveLocale(Locale locale) {
    // TODO: implement saveLocale
    throw UnimplementedError();
  }
}
