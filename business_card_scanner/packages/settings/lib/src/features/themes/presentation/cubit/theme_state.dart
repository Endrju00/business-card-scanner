part of 'theme_cubit.dart';

enum ThemeStatus { initial, loading, saving, loaded, error }

class ThemeState extends Equatable {
  final ThemeStatus status;
  final ThemePreferences preferences;
  final Failure? error;

  const ThemeState({
    this.status = ThemeStatus.initial,
    this.preferences = const ThemePreferences(isDarkMode: false),
    this.error,
  });

  @override
  List<Object?> get props => [status, preferences];

  ThemeState copyWith({
    ThemeStatus? status,
    ThemePreferences? preferences,
    Failure? error,
  }) {
    return ThemeState(
      status: status ?? this.status,
      preferences: preferences ?? this.preferences,
      error: error,
    );
  }
}
