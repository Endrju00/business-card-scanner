import 'package:core/equatable.dart';

class ThemePreferences extends Equatable {
  final bool isDarkMode;

  const ThemePreferences({
    required this.isDarkMode,
  });

  @override
  List<Object?> get props => [isDarkMode];
}
