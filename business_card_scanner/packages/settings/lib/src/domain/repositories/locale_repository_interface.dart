
import 'dart:ui';

import 'package:core/dartz.dart';
import 'package:core/errors.dart';

abstract class ILocaleRepository {
  Future<Either<Failure, Locale>> getLocale();

  Future<void> saveLocale(Locale locale);
}
