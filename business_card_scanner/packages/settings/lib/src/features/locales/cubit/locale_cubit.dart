import 'dart:ui';

import 'package:core/equatable.dart';
import 'package:core/bloc.dart';
import 'package:core/errors.dart';
import 'package:core/usecases.dart';
import 'package:settings/settings.dart';
import 'package:settings/src/domain/usecases/locale_usecases.dart';

part 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  final GetLocale getLocale;
  final SaveLocale saveLocale;

  LocaleCubit({
    required this.getLocale,
    required this.saveLocale,
  }) : super(LocaleStarted());

  Future<void> _onLocaleError(Failure failure) async {
    emit(LocaleError(error: failure));
    const defaultLocale = Locale('en');
    await cacheLocale(defaultLocale);
  }

  Future<void> loadLocale() async {
    emit(LocaleLoading());
    final result = await getLocale(NoParams());

    result.fold(
      (failure) => _onLocaleError(failure),
      (locale) => emit(LocaleLoaded(locale: locale)),
    );
  }

  Future<void> cacheLocale(Locale locale) async {
    emit(LocaleSaving());
    final result = await saveLocale(locale);
    result.fold(
      (failure) => emit(LocaleError(error: failure)),
      (_) => emit(LocaleLoaded(locale: locale)),
    );
  }
}
