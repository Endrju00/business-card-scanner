import 'package:core/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:settings/src/data/repositories/theme_repository.dart';
import 'package:settings/src/domain/domain.dart';
import 'package:settings/src/domain/entities/entities.dart';

import 'change_theme_mode_test.mocks.dart';

@GenerateMocks([ThemeRepository])
void main() {
  late ChangeThemeMode usecase;
  late MockThemeRepository mockThemeRepository;

  setUp(() {
    mockThemeRepository = MockThemeRepository();
    usecase = ChangeThemeMode(mockThemeRepository);
  });

  const tThemePreferences = ThemePreferences(isDarkMode: true);

  test('should update theme preferences from the repository', () async {
    // arrange
    when(mockThemeRepository.updateThemePreferences(tThemePreferences))
        .thenAnswer((_) async => const Right(null));
    // act
    final result = await usecase(ChangeThemeModeParams(isDarkMode: true));
    // assert
    expect(result, const Right(null));
    verify(mockThemeRepository.updateThemePreferences(tThemePreferences));
    verifyNoMoreInteractions(mockThemeRepository);
  });
}
