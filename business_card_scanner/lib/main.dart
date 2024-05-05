import 'package:business_card_scanner/src/injection_container.dart' as di;
import 'package:business_card_scanner/src/injection_container.dart';
import 'package:core/bloc.dart';
import 'package:flutter/material.dart';
import 'package:settings/settings.dart';

import 'src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  di.setup();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<LocaleCubit>(
        create: (BuildContext context) => LocaleCubit(
          getLocale: getIt(),
          saveLocale: getIt(),
        ),
      ),
    ],
    child: const MyApp(),
  ));
}
