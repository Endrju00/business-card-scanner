import 'dart:ui';

import 'package:core/errors.dart';
import 'package:core/secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:settings/src/data/datasources/local_data_source.dart';
import 'package:settings/src/data/models/theme_preferences_model.dart';

import 'local_data_source_test.mocks.dart';

@GenerateMocks([FlutterSecureStorage])
void main() {
  late MockFlutterSecureStorage mockFlutterSecureStorage;
  late SettingsLocalDataSource dataSource;

  setUp(() {
    mockFlutterSecureStorage = MockFlutterSecureStorage();
    dataSource = SettingsLocalDataSource(storage: mockFlutterSecureStorage);
  });

  const tLanguageCode = 'en';

  group('getLocale', () {
    test('should get locale from the secure storage', () async {
      // arrange
      when(mockFlutterSecureStorage.read(
              key: SettingsLocalDataSource.localeKey))
          .thenAnswer((_) async => tLanguageCode);
      // act
      final result = await dataSource.getLocale();
      // assert
      expect(result.languageCode, tLanguageCode);
      verify(mockFlutterSecureStorage.read(
          key: SettingsLocalDataSource.localeKey));
    });

    test('should throw an exception when there is no data saved', () async {
      // arrange
      when(mockFlutterSecureStorage.read(
              key: SettingsLocalDataSource.localeKey))
          .thenThrow(CacheException());
      // act
      final call = dataSource.getLocale;
      // assert
      expect(() => call(), throwsA(isA<CacheException>()));
      verify(mockFlutterSecureStorage.read(
          key: SettingsLocalDataSource.localeKey));
    });
  });

  group('saveLocale', () {
    test('should save the locale to the secure storage', () async {
      // arrange
      when(mockFlutterSecureStorage.write(
        key: SettingsLocalDataSource.localeKey,
        value: tLanguageCode,
      )).thenAnswer((_) async {});
      // act
      await dataSource.saveLocale(const Locale(tLanguageCode));
      // assert
      verify(mockFlutterSecureStorage.write(
        key: SettingsLocalDataSource.localeKey,
        value: tLanguageCode,
      ));
    });
  });

  group('getThemePreferences', () {
    test('should get theme preferences from the secure storage', () async {
      // arrange
      when(mockFlutterSecureStorage.read(key: SettingsLocalDataSource.themeKey))
          .thenAnswer((_) async => '{"isDarkMode":true}');
      // act
      final result = await dataSource.getThemePreferences();
      // assert
      expect(result, isA<ThemePreferencesModel>());
      verify(
          mockFlutterSecureStorage.read(key: SettingsLocalDataSource.themeKey));
    });

    test('should throw an exception when there is no data saved', () async {
      // arrange
      when(mockFlutterSecureStorage.read(key: SettingsLocalDataSource.themeKey))
          .thenThrow(CacheException());
      // act
      final call = dataSource.getThemePreferences;
      // assert
      expect(() => call(), throwsA(isA<CacheException>()));
      verify(
          mockFlutterSecureStorage.read(key: SettingsLocalDataSource.themeKey));
    });
  });

  group('saveThemePreferences', () {
    test('should save the theme preferences to the secure storage', () async {
      // arrange
      when(mockFlutterSecureStorage.write(
        key: SettingsLocalDataSource.themeKey,
        value: '{"isDarkMode":true}',
      )).thenAnswer((_) async {});
      // act
      await dataSource
          .saveThemePreferences(const ThemePreferencesModel(isDarkMode: true));
      // assert
      verify(mockFlutterSecureStorage.write(
        key: SettingsLocalDataSource.themeKey,
        value: '{"isDarkMode":true}',
      ));
    });

    test('should throw an cache exception when save failed', () async {
      // arrange
      when(mockFlutterSecureStorage.write(
        key: SettingsLocalDataSource.themeKey,
        value: '{"isDarkMode":true}',
      )).thenThrow(CacheException());
      // act
      final call = dataSource
          .saveThemePreferences(const ThemePreferencesModel(isDarkMode: true));
      // assert
      expect(() => call, throwsA(isA<CacheException>()));
    });
  });
}
