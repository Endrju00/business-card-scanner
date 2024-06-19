import 'package:core/widgets.dart';
import 'package:flutter/material.dart';
import 'package:settings/l10n/settings_localizations.dart';
import 'package:settings/settings.dart';

class SettingsSheet extends StatelessWidget {
  const SettingsSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BcsBottomSheet(
      title: 'Settings',
      onClose: () => Navigator.of(context).pop(),
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(SettingsLocalizations.of(context).language),
          trailing: const LocaleDropdown(),
        )
      ],
    );
  }
}
