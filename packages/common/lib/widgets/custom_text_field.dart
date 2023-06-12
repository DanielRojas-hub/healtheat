import 'package:flutter/material.dart';

import '../utils/utils.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      this.icon,
      this.onTap,
      this.readOnly,
      this.prefixText,
      this.textInputType,
      this.maxLines});
  final Icon? icon;
  final VoidCallback? onTap;
  final bool? readOnly;
  final String? prefixText;
  final TextInputType? textInputType;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines ?? 1,
      onTap: onTap,
      readOnly: readOnly ?? false,
      keyboardType: textInputType ?? TextInputType.text,
      decoration: inputDecorationBorderMethod(context).copyWith(
        filled: true,
        fillColor: Theme.of(context).cardColor,
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
