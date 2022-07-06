import 'package:flutter/material.dart';
import 'package:flutter_bukit_vista_assessment/theme/theme.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.lable,
    required this.body,
    this.textStyle,
    this.alignment,
  }) : super(key: key);

  final String body;
  final String lable;
  final TextStyle? textStyle;
  final CrossAxisAlignment? alignment;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: alignment ?? CrossAxisAlignment.start,
      children: [
        Text(lable, style: AppTheme.subtitle),
        const SizedBox(height: 5),
        Text(body,
            style: textStyle ??
                AppTheme.body.copyWith(fontWeight: FontWeight.w500)),
      ],
    );
  }
}
