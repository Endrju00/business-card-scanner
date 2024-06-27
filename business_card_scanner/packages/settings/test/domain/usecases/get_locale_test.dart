import 'dart:ui';

import 'package:core/dartz.dart';
import 'package:core/usecases.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:settings/src/data/repositories/locale_repository.dart';
import 'package:settings/src/domain/usecases/get_locale.dart';

import 'get_locale_test.mocks.dart';

@GenerateMocks([LocaleRepository])
void main() {
  late GetLocale usecase;
  late MockLocaleRepository mockLocaleRepository;

  setUp(() {
    mockLocaleRepository = MockLocaleRepository();
    usecase = GetLocale(mockLocaleRepository);
  });

  const tLocale = Locale('en');

  test('should get locale from the repository', () async {
    // arrange
    when(mockLocaleRepository.getLocale())
        .thenAnswer((_) async => const Right(tLocale));
    // act
    final result = await usecase(NoParams());
    // assert
    expect(result, const Right(tLocale));
    verify(mockLocaleRepository.getLocale());
    verifyNoMoreInteractions(mockLocaleRepository);
  });
}
