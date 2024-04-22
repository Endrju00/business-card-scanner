part of 'locale_cubit.dart';

@immutable
sealed class LocaleState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class LocaleStarted extends LocaleState {}

final class LocaleLoading extends LocaleState {}

final class LocaleLoaded extends LocaleState {
  LocaleLoaded({required this.locale});

  final Locale locale;

  @override
  List<Object?> get props => [locale];
}

final class LocaleSaving extends LocaleState {}

final class LocaleSaved extends LocaleState {}

final class LocaleError extends LocaleState {
  LocaleError({required this.error});

  final Failure error;

  @override
  List<Object?> get props => [error];
}
