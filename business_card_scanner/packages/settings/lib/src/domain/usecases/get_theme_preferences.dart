import 'package:core/dartz.dart';
import 'package:core/errors.dart';
import 'package:core/usecases.dart';

import '../entities/entities.dart';
import '../repositories/theme_repository_interface.dart';

class GetThemePreferences extends UseCase<ThemePreferences, NoParams> {
  final IThemeRepository repository;

  GetThemePreferences(this.repository);

  @override
  Future<Either<Failure, ThemePreferences>> call(NoParams params) async {
    return await repository.getThemePreferences();
  }
}
