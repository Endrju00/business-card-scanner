import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../widgets/app_drawer.dart';
import '../widgets/bcs_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 64,
        leadingWidth: 88,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: BcsContainer(
            height: 48,
            width: 48,
            borderRadius: BorderRadius.circular(50),
            child: const Icon(
              size: 48,
              Icons.account_circle_rounded,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      endDrawer: const AppDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              AppLocalizations.of(context)!.appName,
            ),
          ],
        ),
      ),
    );
  }
}
