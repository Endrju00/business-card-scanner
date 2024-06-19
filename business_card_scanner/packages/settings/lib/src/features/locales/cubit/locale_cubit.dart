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
  }) : super(const LocaleState());

  static const _defaultLocale = Locale('en');

  Future<void> _onLocaleError(Failure failure) async {
    emit(state.copyWith(
      status: LocaleStatus.error,
      locale: _defaultLocale,
      error: failure,
    ));

    await cacheLocale(_defaultLocale);
  }

  Future<void> loadLocale() async {
    emit(state.copyWith(status: LocaleStatus.loading));
    final result = await getLocale(NoParams());

    result.fold(
      (failure) => _onLocaleError(failure),
      (locale) => emit(state.copyWith(
        status: LocaleStatus.loaded,
        locale: locale,
      )),
    );
  }

  Future<void> cacheLocale(Locale locale) async {
    emit(state.copyWith(status: LocaleStatus.saving));
    final result = await saveLocale(locale);
    result.fold(
      (failure) => emit(state.copyWith(
        status: LocaleStatus.error,
        locale: _defaultLocale,
        error: failure,
      )),
      (_) => emit(state.copyWith(
        status: LocaleStatus.loaded,
        locale: locale,
      )),
    );
  }
}
