import 'package:core/dartz.dart';
import 'package:core/errors.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:settings/settings.dart';
import 'package:settings/src/data/models/theme_preferences_model.dart';
import 'package:settings/src/data/repositories/theme_repository.dart';
import 'package:settings/src/domain/entities/entities.dart';

import 'theme_repository_test.mocks.dart';

@GenerateMocks([SettingsLocalDataSource])
void main() {
  late ThemeRepository repository;
  late MockSettingsLocalDataSource mockLocalDataSource;

  setUp(() {
    mockLocalDataSource = MockSettingsLocalDataSource();
    repository = ThemeRepository(localDataSource: mockLocalDataSource);
  });

  const tThemePreferencesModel = ThemePreferencesModel(isDarkMode: true);

  const ThemePreferences tThemePreferences = tThemePreferencesModel;

  group('getThemePreferences', () {
    test('should return theme preferences from local data source', () async {
      // arrange
      when(mockLocalDataSource.getThemePreferences())
          .thenAnswer((_) async => tThemePreferencesModel);
      // act
      final result = await repository.getThemePreferences();
      // assert
      expect(result, const Right(tThemePreferences));
      verify(mockLocalDataSource.getThemePreferences());
      verifyNoMoreInteractions(mockLocalDataSource);
    });

    test('should return cache failure when exception occurs', () async {
      // arrange
      when(mockLocalDataSource.getThemePreferences())
          .thenThrow(CacheException());
      // act
      final result = await repository.getThemePreferences();
      // assert
      expect(result, Left(CacheFailure()));
      verify(mockLocalDataSource.getThemePreferences());
      verifyNoMoreInteractions(mockLocalDataSource);
    });
  });
}
