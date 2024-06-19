import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:settings/l10n/settings_localizations.dart';

class AppL10n {
  AppL10n._();

  static const en = Locale('en');
  static const pl = Locale('pl');

  static const List<Locale> supportedLocales = [en, pl];

  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = [
    ...AppLocalizations.localizationsDelegates,
    ...SettingsLocalizations.localizationsDelegates,
  ];
}
