import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/utils.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      this.icon,
      this.onTap,
      this.readOnly,
      this.prefixText,
      this.textInputType,
      this.maxLines,
      this.onChanged,
      this.errorText,
      this.initialValue,
      this.controller,
      this.inputFormatters});

  final Icon? icon;
  final VoidCallback? onTap;
  final bool? readOnly;
  final String? prefixText;
  final TextInputType? textInputType;
  final int? maxLines;
  final ValueChanged<String>? onChanged;
  final String? errorText;
  final String? initialValue;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines ?? 1,
      controller: controller,
      onTap: onTap,
      onChanged: onChanged,
      initialValue: initialValue,
      inputFormatters: inputFormatters,
      readOnly: readOnly ?? false,
      keyboardType: textInputType ?? TextInputType.text,
      decoration: inputDecorationBorderMethod(context).copyWith(
        filled: true,
        fillColor: Theme.of(context).cardColor,
        errorText: errorText,
        prefixIcon: prefixText != null
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(prefixText!,
                        style: Theme.of(context).textTheme.labelLarge),
                  ],
                ),
              )
            : icon != null
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: icon,
                  )
                : null,
      ),
    );
  }
}
