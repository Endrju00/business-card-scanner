import 'package:business_card_scanner/src/injection_container.dart' as di;
import 'package:flutter/material.dart';

import 'src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  di.setup();
  runApp(const App());
}
