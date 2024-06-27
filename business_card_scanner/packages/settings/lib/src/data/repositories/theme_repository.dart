import 'package:core/dartz.dart';
import 'package:core/errors.dart';
import 'package:settings/src/data/models/theme_preferences_model.dart';

import '../../domain/entities/theme_preferences.dart';
import '../../domain/repositories/theme_repository_interface.dart';
import '../datasources/local_data_source.dart';

class ThemeRepository implements IThemeRepository {
  final ISettingsLocalDataSource localDataSource;

  ThemeRepository({
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, ThemePreferences>> getThemePreferences() async {
    try {
      final themePreferences = await localDataSource.getThemePreferences();
      return Right(themePreferences);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updateThemePreferences(
    ThemePreferences themePreferences,
  ) async {
    try {
      final result = await localDataSource.saveThemePreferences(
          ThemePreferencesModel(isDarkMode: themePreferences.isDarkMode));

      return Right(result);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
