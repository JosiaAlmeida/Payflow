import 'package:flutter/material.dart';
import 'package:payflow/shared/thems/app_text_style.dart';

class LabelButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  const LabelButton({Key? key, required this.label, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: () {}, child: Text(label, style: AppTextStyles.buttonHeading,));
  }
}
