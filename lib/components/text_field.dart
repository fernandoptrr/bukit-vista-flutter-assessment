import 'package:flutter/material.dart';
import 'package:flutter_bukit_vista_assessment/theme/theme.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.label,
    required this.body,
    this.bodyTextStyle,
    this.alignment,
  }) : super(key: key);

  final String body;
  final String label;
  final TextStyle? bodyTextStyle;
  final CrossAxisAlignment? alignment;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: alignment ?? CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTheme.subtitle),
        const SizedBox(height: 5),
        Text(body,
            style: bodyTextStyle ??
                AppTheme.body.copyWith(fontWeight: FontWeight.w500)),
      ],
    );
  }
}
