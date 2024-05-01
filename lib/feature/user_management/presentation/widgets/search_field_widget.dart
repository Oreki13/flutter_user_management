import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SearchFieldWidget extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final TextEditingController? controller;
  final Function(String)? onChange;

  const SearchFieldWidget({
    super.key,
    this.labelText,
    this.controller,
    this.hintText,
    this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        labelText == null
            ? const SizedBox()
            : Text(
                labelText!,
                style: theme.textTheme.bodyLarge,
              ),
        TextFormField(
          controller: controller,
          onTapOutside: (_) {
            FocusScope.of(context).unfocus();
          },
          onChanged: onChange,
          cursorColor: theme.colorScheme.onPrimary,
          validator: (value) {
            if (value!.isEmpty) {
              return "Harap isi $labelText";
            }
            return null;
          },
          style: theme.textTheme.bodyLarge,
          decoration: InputDecoration(
            hintText: hintText,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 3.w,
              vertical: 1.h,
            ),
            hintStyle: theme.textTheme.bodyMedium!
                .copyWith(color: theme.colorScheme.surface.withOpacity(0.5)),
            border: const OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: theme.colorScheme.onPrimary,
              ),
            ),
            focusColor: theme.colorScheme.onPrimary,
          ),
        ),
      ],
    );
  }
}
