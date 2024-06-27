import 'dart:ui';

import 'package:core/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:settings/src/data/repositories/locale_repository.dart';
import 'package:settings/src/domain/usecases/save_locale.dart';

import 'save_locale_test.mocks.dart';

@GenerateMocks([LocaleRepository])
void main() {
  late SaveLocale usecase;
  late MockLocaleRepository mockLocaleRepository;

  setUp(() {
    mockLocaleRepository = MockLocaleRepository();
    usecase = SaveLocale(mockLocaleRepository);
  });

  const tLocale = Locale('en');

  test(
    'should save the locale to the repository',
    () async {
      // arrange
      when(mockLocaleRepository.saveLocale(tLocale))
          .thenAnswer((_) async => const Right(null));
      // act
      await usecase(tLocale);
      // assert
      verify(mockLocaleRepository.saveLocale(tLocale));
      verifyNoMoreInteractions(mockLocaleRepository);
    },
  );
}
