import 'package:core/widgets.dart';
import 'package:flutter/material.dart';

class BcsBottomSheet extends StatelessWidget {
  final String title;
  final String closeText;
  final Function()? onClose;
  final List<Widget> children;

  const BcsBottomSheet({
    super.key,
    required this.title,
    this.closeText = 'Save',
    this.onClose,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.displaySmall,
          ),
          const SizedBox(height: 24),
          Flexible(
            child: ListView(
              shrinkWrap: true,
              children: children,
            ),
          ),
          BcsButton(
            onPressed: onClose,
            padding: const EdgeInsets.symmetric(vertical: 8),
            text: closeText,
          ),
        ],
      ),
    );
  }
}
