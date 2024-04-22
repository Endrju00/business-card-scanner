import 'package:core/bloc.dart';
import 'package:flutter/material.dart';
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
          items: const [
            DropdownMenuItem(
              value: Locale('en'),
              child: Text('English'),
            ),
            DropdownMenuItem(
              value: Locale('pl'),
              child: Text('Polish'),
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
