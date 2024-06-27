import 'package:core/dartz.dart';
import 'package:core/usecases.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:settings/src/data/repositories/theme_repository.dart';
import 'package:settings/src/domain/domain.dart';
import 'package:settings/src/domain/entities/entities.dart';

import 'get_theme_preferences_test.mocks.dart';

@GenerateMocks([ThemeRepository])
void main() {
  late GetThemePreferences usecase;
  late MockThemeRepository mockThemeRepository;

  setUp(() {
    mockThemeRepository = MockThemeRepository();
    usecase = GetThemePreferences(mockThemeRepository);
  });

  const tThemePreferences = ThemePreferences(isDarkMode: true);

  test('should get theme preferences from the repository', () async {
    // arrange
    when(mockThemeRepository.getThemePreferences())
        .thenAnswer((_) async => const Right(tThemePreferences));
    // act
    final result = await usecase(NoParams());
    // assert
    expect(result, const Right(tThemePreferences));
    verify(mockThemeRepository.getThemePreferences());
    verifyNoMoreInteractions(mockThemeRepository);
  });
}
