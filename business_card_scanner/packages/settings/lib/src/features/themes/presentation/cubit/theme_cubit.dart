import 'package:core/bloc.dart';
import 'package:core/equatable.dart';
import 'package:core/errors.dart';

import '../../../../domain/domain.dart';
import '../../../../domain/entities/entities.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  final GetThemePreferences getThemePreferences;
  final SaveThemePreferences saveThemePreferences;

  ThemeCubit({
    required this.getThemePreferences,
    required this.saveThemePreferences,
  }) : super(const ThemeState());
}
