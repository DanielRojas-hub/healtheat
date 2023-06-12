import 'package:flutter/material.dart';

import '../utils/utils.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.icon,
    this.onTap,
    this.readOnly,
    this.prefixText,
    this.textInputType,
    this.onChanged,
    this.errorText,
    this.maxLines,
  });

  final Icon? icon;
  final VoidCallback? onTap;
  final bool? readOnly;
  final String? prefixText;
  final TextInputType? textInputType;
  final ValueChanged<String>? onChanged;
  final String? errorText;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines ?? 1,
      onTap: onTap,
      onChanged: onChanged,
      readOnly: readOnly ?? false,
      keyboardType: textInputType ?? TextInputType.text,
      decoration: inputDecorationBorderMethod(context).copyWith(
        prefixText: prefixText,
        filled: true,
        fillColor: Theme.of(context).cardColor,
        prefixIcon: icon,
        errorText: errorText,
      ),
    );
  }
}
