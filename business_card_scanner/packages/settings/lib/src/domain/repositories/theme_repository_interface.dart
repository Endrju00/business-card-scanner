import 'package:core/dartz.dart';
import 'package:core/errors.dart';

import '../entities/theme_preferences.dart';

abstract class IThemeRepository {
  Future<Either<Failure, ThemePreferences>> getThemePreferences();

  Future<Either<Failure, void>> updateThemePreferences(
      ThemePreferences themePreferences);
}
