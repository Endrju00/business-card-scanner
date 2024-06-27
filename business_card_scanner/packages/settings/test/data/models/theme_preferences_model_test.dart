import 'package:flutter_test/flutter_test.dart';
import 'package:settings/src/data/models/theme_preferences_model.dart';
import 'package:settings/src/domain/entities/entities.dart';

void main() {
  const tThemePreferencesModel = ThemePreferencesModel(isDarkMode: true);

  test('should be a subclass of ThemePreferences entity', () {
    // assert
    expect(tThemePreferencesModel, isA<ThemePreferences>());
  });

  group('fromJson', () {
    test('should return a valid model when the JSON is true', () {
      // arrange
      final Map<String, dynamic> jsonMap = {'isDarkMode': true};
      // act
      final result = ThemePreferencesModel.fromJson(jsonMap);
      // assert
      expect(result, tThemePreferencesModel);
    });
  });

  group('toJson', () {
    test('should return a JSON map containing the proper data', () {
      // act
      final result = tThemePreferencesModel.toJson();
      // assert
      expect(result, {'isDarkMode': true});
    });
  });
}
