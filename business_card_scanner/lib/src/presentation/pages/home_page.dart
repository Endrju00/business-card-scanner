import 'package:business_card_scanner/src/presentation/widgets/bcs_container.dart';
import 'package:core/widgets.dart';
import 'package:flutter/material.dart';
import 'package:settings/settings.dart';

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
              const Spacer(),
              BcsButton(
                onPressed: () => _openBottomSheet(context),
                text: 'Settings',
              ),
              BcsButton(
                onPressed: () {},
                text: 'Log out',
              ),
            ],
          ),
        ),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('MVP Business Card Scanner'),
          ],
        ),
      ),
    );
  }
}
