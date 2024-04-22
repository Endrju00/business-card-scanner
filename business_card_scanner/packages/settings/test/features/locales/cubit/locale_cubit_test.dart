import 'dart:ui';

import 'package:bloc_test/bloc_test.dart';
import 'package:core/dartz.dart';
import 'package:core/errors.dart';
import 'package:core/usecases.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:settings/settings.dart';

import 'locale_cubit_test.mocks.dart';

@GenerateMocks([GetLocale, SaveLocale])
void main() {
  late LocaleCubit localeCubit;
  late MockGetLocale mockGetLocale;
  late MockSaveLocale mockSaveLocale;

  setUp(() {
    mockGetLocale = MockGetLocale();
    mockSaveLocale = MockSaveLocale();
    localeCubit = LocaleCubit(
      getLocale: mockGetLocale,
      saveLocale: mockSaveLocale,
    );
  });

  test('initial state is LocaleStarted', () {
    expect(localeCubit.state, LocaleStarted());
  });

  const tLocale = Locale('en');

  group('loadLocale', () {
    blocTest(
      'emits [LocaleLoading, LocaleLoaded] when GetLocale succeeds',
      build: () {
        when(mockGetLocale(NoParams()))
            .thenAnswer((_) async => const Right(tLocale));
        return localeCubit;
      },
      act: (cubit) => cubit.loadLocale(),
      expect: () => [LocaleLoading(), LocaleLoaded(locale: tLocale)],
    );

    blocTest(
      'emits proper states when GetLocale fails, loads default locale and saves it',
      build: () {
        when(mockGetLocale(NoParams()))
            .thenAnswer((_) async => Left(CacheFailure()));
        when(mockSaveLocale(tLocale))
            .thenAnswer((_) async => const Right(null));
        return localeCubit;
      },
      act: (cubit) => cubit.loadLocale(),
      expect: () => [
        LocaleLoading(),
        LocaleError(error: CacheFailure()),
        LocaleSaving(),
        LocaleLoaded(locale: tLocale),
      ],
    );

    blocTest(
      'emits proper states when GetLocale fails with UnknownFailure, loads default locale and saves it',
      build: () {
        when(mockGetLocale(NoParams()))
            .thenAnswer((_) async => Left(UnknownFailure()));
        when(mockSaveLocale(tLocale))
            .thenAnswer((_) async => const Right(null));
        return localeCubit;
      },
      act: (cubit) => cubit.loadLocale(),
      expect: () => [
        LocaleLoading(),
        LocaleError(error: UnknownFailure()),
        LocaleSaving(),
        LocaleLoaded(locale: tLocale),
      ],
    );
  });

  group('cacheLocale', () {
    blocTest(
      'emits [LocaleSaving, LocaleLoaded] when SaveLocale succeeds',
      build: () {
        when(mockSaveLocale(tLocale))
            .thenAnswer((_) async => const Right(null));
        return localeCubit;
      },
      act: (cubit) => cubit.cacheLocale(tLocale),
      expect: () => [LocaleSaving(), LocaleLoaded(locale: tLocale)],
    );

    blocTest(
      'emits [LocaleSaving, LocaleError] when SaveLocale fails',
      build: () {
        when(mockSaveLocale(tLocale)).thenAnswer(
          (_) async => Left(UnknownFailure()),
        );
        return localeCubit;
      },
      act: (cubit) => cubit.cacheLocale(tLocale),
      expect: () => [LocaleSaving(), LocaleError(error: UnknownFailure())],
    );
  });
}
