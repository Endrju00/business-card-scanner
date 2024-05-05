import 'dart:ui';

import 'package:core/dartz.dart';
import 'package:core/errors.dart';
import 'package:core/usecases.dart';

import '../repositories/locale_repository_interface.dart';

class SaveLocale extends UseCase<void, Locale> {
  final ILocaleRepository repository;

  SaveLocale(this.repository);

  @override
  Future<Either<Failure, void>> call(Locale params) async {
    return await repository.saveLocale(params);
  }
}
