import 'package:core/dartz.dart';
import 'package:core/errors.dart';

import '../../domain/entities/theme_preferences.dart';
import '../../domain/repositories/theme_repository_interface.dart';

class ThemeRepository implements IThemeRepository {
  @override
  Future<Either<Failure, ThemePreferences>> getThemePreferences() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> updateThemePreferences(
    ThemePreferences themePreferences,
  ) {
    throw UnimplementedError();
  }
}
