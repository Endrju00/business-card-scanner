import 'dart:ui';
import 'dart:developer';

import 'package:core/errors.dart';
import 'package:core/dartz.dart';

import '../../domain/repositories/locale_repository_interface.dart';
import '../datasources/local_data_source.dart';

class LocaleRepository implements ILocaleRepository {
  final LocalDataSource localDataSource;

  LocaleRepository({
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, Locale>> getLocale() async {
    try {
      final locale = await localDataSource.getLocale();
      return Right(locale);
    } on CacheException {
      return Left(CacheFailure());
    } catch (e) {
      log(e.toString(), name: 'LocaleRepository');
      return Left(UnknownFailure());
    }
  }

  @override
  Future<void> saveLocale(Locale locale) async {
    // TODO: implement saveLocale
    throw UnimplementedError();
  }
}
