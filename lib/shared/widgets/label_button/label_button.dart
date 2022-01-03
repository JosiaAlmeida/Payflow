import 'package:flutter/material.dart';
import 'package:payflow/shared/thems/app_text_style.dart';

class LabelButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final TextStyle? Style;
  const LabelButton({Key? key, required this.label, required this.onPressed, this.Style})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 56,
        child: TextButton(
            onPressed: () {},
            child: Text(
              label,
              style: Style ?? AppTextStyles.buttonHeading,
            )));
  }
}
