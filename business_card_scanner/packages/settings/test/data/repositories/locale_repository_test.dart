import 'dart:ui';

import 'package:core/dartz.dart';
import 'package:core/errors.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:settings/src/data/datasources/local_data_source.dart';
import 'package:settings/src/data/repositories/locale_repository.dart';

import 'locale_repository_test.mocks.dart';

@GenerateMocks([SettingsLocalDataSource])
void main() {
  late LocaleRepository repository;
  late MockSettingsLocalDataSource mockLocalDataSource;

  setUp(() {
    mockLocalDataSource = MockSettingsLocalDataSource();
    repository = LocaleRepository(localDataSource: mockLocalDataSource);
  });

  const tLocale = Locale('en');

  group('getLocale', () {
    test('should get locale from the local data source', () async {
      // arrange
      when(mockLocalDataSource.getLocale()).thenAnswer((_) async => tLocale);
      // act
      final result = await repository.getLocale();
      // assert
      verify(mockLocalDataSource.getLocale());
      expect(result, const Right(tLocale));
    });

    test('should return CacheFailure when there is no data saved', () async {
      // arrange
      when(mockLocalDataSource.getLocale()).thenThrow(CacheException());
      // act
      final result = await repository.getLocale();
      // assert
      verify(mockLocalDataSource.getLocale());
      expect(result, equals(Left(CacheFailure())));
    });

    test('should return UnknownFailure when an unknown error occurs', () async {
      // arrange
      when(mockLocalDataSource.getLocale()).thenThrow(Exception());
      // act
      final result = await repository.getLocale();
      // assert
      verify(mockLocalDataSource.getLocale());
      expect(result, equals(Left(UnknownFailure())));
    });
  });

  group('saveLocale', () {
    test('should save the locale to the local data source', () async {
      // arrange
      when(mockLocalDataSource.saveLocale(tLocale)).thenAnswer((_) async {});
      // act
      await repository.saveLocale(tLocale);
      // assert
      verify(mockLocalDataSource.saveLocale(tLocale));
    });

    test('should return UnknownFailure when an unknown error occurs', () async {
      // arrange
      when(mockLocalDataSource.saveLocale(tLocale)).thenThrow(Exception());
      // act
      final result = await repository.saveLocale(tLocale);
      // assert
      verify(mockLocalDataSource.saveLocale(tLocale));
      expect(result, equals(Left(UnknownFailure())));
    });
  });
}
