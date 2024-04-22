import 'package:flutter/material.dart';

class LocaleDropdown extends StatelessWidget {
  const LocaleDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      elevation: 0,
      borderRadius: BorderRadius.circular(16),
      alignment: Alignment.centerLeft,
      underline: Container(),
      value: const Locale('en'),
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
      onChanged: (value) {},
    );
  }
}
