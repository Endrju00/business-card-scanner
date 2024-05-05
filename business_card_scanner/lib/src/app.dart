import 'package:core/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:settings/settings.dart';

import 'presentation/pages/splash_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void _initLocale() async {
    await context.read<LocaleCubit>().loadLocale();
  }

  @override
  void initState() {
    super.initState();
    _initLocale();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleCubit, LocaleState>(builder: (context, state) {
      return MaterialApp(
        title: 'Business Card Scanner',
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: state is LocaleLoaded ? state.locale : const Locale('en'),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF3F37C9)),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      );
    });
  }
}
