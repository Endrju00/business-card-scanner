part of 'locale_cubit.dart';

enum LocaleStatus { initial, loading, saving, loaded, error }

class LocaleState extends Equatable {
  final LocaleStatus status;
  final Locale locale;
  final Failure? error;

  const LocaleState({
    this.status = LocaleStatus.initial,
    this.locale = const Locale('en'),
    this.error,
  });

  @override
  List<Object?> get props => [status, locale];

  LocaleState copyWith({
    LocaleStatus? status,
    Locale? locale,
    Failure? error,
  }) {
    return LocaleState(
      status: status ?? this.status,
      locale: locale ?? this.locale,
      error: error,
    );
  }
}
