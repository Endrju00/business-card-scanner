import 'dart:ui';

import 'package:core/dartz.dart';
import 'package:core/errors.dart';

abstract class ILocaleRepository {
  Future<Either<Failure, Locale>> getLocale();

  Future<Either<Failure, void>> saveLocale(Locale locale);
}
