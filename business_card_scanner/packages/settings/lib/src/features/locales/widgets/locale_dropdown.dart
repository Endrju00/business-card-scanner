import 'package:core/bloc.dart';
import 'package:flutter/material.dart';
import 'package:settings/l10n/settings_localizations.dart';
import 'package:settings/src/features/locales/cubit/locale_cubit.dart';

class LocaleDropdown extends StatelessWidget {
  const LocaleDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleCubit, LocaleState>(
      builder: (context, state) {
        if (state is LocaleSaving) {
          return const CircularProgressIndicator.adaptive();
        }

        return DropdownButton(
          elevation: 0,
          borderRadius: BorderRadius.circular(16),
          alignment: Alignment.centerLeft,
          underline: Container(),
          value: state is LocaleLoaded ? state.locale : const Locale('en'),
          items: [
            DropdownMenuItem(
              value: const Locale('en'),
              child: Text(SettingsLocalizations.of(context).english),
            ),
            DropdownMenuItem(
              value: const Locale('pl'),
              child: Text(SettingsLocalizations.of(context).polish),
            ),
          ],
          onChanged: (value) async {
            await context.read<LocaleCubit>().cacheLocale(value!);
          },
        );
      },
    );
  }
}
