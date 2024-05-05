import 'package:core/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:settings/settings.dart';


class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
  });

  void _openBottomSheet(BuildContext context) => showModalBottomSheet<void>(
        context: context,
        isDismissible: false,
        useSafeArea: true,
        builder: (BuildContext context) => const SettingsSheet(),
      );

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
    );
  }
}
