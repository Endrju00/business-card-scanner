import 'package:core/dartz.dart';
import 'package:core/errors.dart';
import 'package:core/usecases.dart';

import '../entities/entities.dart';
import '../repositories/theme_repository_interface.dart';

class ChangeThemeMode extends UseCase<void, ChangeThemeModeParams> {
  final IThemeRepository repository;

  ChangeThemeMode(this.repository);

  @override
  Future<Either<Failure, void>> call(ChangeThemeModeParams params) async {
    return await repository.updateThemePreferences(
        ThemePreferences(isDarkMode: params.isDarkMode));
  }
}

class ChangeThemeModeParams {
  final bool isDarkMode;

  ChangeThemeModeParams({required this.isDarkMode});
}
