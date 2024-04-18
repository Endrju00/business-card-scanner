import 'dart:ui';

import 'package:core/dartz.dart';
import 'package:core/errors.dart';
import 'package:core/usecases.dart';

import '../repositories/locale_repository_interface.dart';

class GetLocale extends UseCase<Locale, NoParams> {
  final ILocaleRepository repository;

  GetLocale(this.repository);

  @override
  Future<Either<Failure, Locale>> call(NoParams params) async {
    return await repository.getLocale();
  }
}
