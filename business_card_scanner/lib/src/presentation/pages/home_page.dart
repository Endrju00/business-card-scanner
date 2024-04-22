import 'package:core/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:settings/settings.dart';

import '../widgets/bcs_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _openBottomSheet(BuildContext context) => showModalBottomSheet<void>(
        context: context,
        isDismissible: false,
        useSafeArea: true,
        builder: (BuildContext context) => const SettingsSheet(),
      );

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
      endDrawer: Drawer(
        backgroundColor: Colors.white,
        child: SafeArea(
          child: Column(
            children: [
              Opacity(
                opacity: 0.7,
                child: SvgPicture.asset(
                  'assets/logo.svg',
                  width: MediaQuery.of(context).size.width * 0.5,
                ),
              ),
              Text(
                AppLocalizations.of(context)!.appName,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const Spacer(),
              BcsButton(
                onPressed: () => _openBottomSheet(context),
                text: AppLocalizations.of(context)!.settings,
              ),
              BcsButton(
                onPressed: () {},
                text: AppLocalizations.of(context)!.logOut,
              ),
            ],
          ),
        ),
      ),
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
