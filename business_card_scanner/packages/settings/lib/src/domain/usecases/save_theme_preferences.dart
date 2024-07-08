import 'package:core/dartz.dart';
import 'package:core/errors.dart';
import 'package:core/usecases.dart';

import '../entities/entities.dart';
import '../repositories/theme_repository_interface.dart';

class SaveThemePreferences extends UseCase<void, SaveThemePreferencesParams> {
  final IThemeRepository repository;

  SaveThemePreferences(this.repository);

  @override
  Future<Either<Failure, void>> call(SaveThemePreferencesParams params) async {
    return await repository.updateThemePreferences(
        ThemePreferences(isDarkMode: params.isDarkMode));
  }
}

class SaveThemePreferencesParams {
  final bool isDarkMode;

  SaveThemePreferencesParams({required this.isDarkMode});
}
