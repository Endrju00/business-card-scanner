import 'dart:ui';
import 'dart:developer';

import 'package:core/errors.dart';
import 'package:core/dartz.dart';

import '../../domain/repositories/locale_repository_interface.dart';
import '../datasources/local_data_source.dart';

class LocaleRepository implements ILocaleRepository {
  final ISettingsLocalDataSource localDataSource;

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
  Future<Either<Failure, void>> saveLocale(Locale locale) async {
    try {
      await localDataSource.saveLocale(locale);
      return const Right(null);
    } catch (e) {
      log(e.toString(), name: 'LocaleRepository');
      return Left(UnknownFailure());
    }
  }
}
