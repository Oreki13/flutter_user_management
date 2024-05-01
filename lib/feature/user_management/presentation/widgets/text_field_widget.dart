import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final AutovalidateMode? autovalidateMode;

  const TextFieldWidget({
    super.key,
    this.labelText,
    this.controller,
    this.hintText,
    this.validator,
    this.keyboardType,
    this.inputFormatters,
    this.autovalidateMode,
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
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          cursorColor: theme.colorScheme.onPrimary,
          autovalidateMode: autovalidateMode,
          validator: validator ??
              (value) {
                if (value!.isEmpty) {
                  return "Harap isi $labelText";
                }
                return null;
              },
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: theme.textTheme.bodyMedium!
                .copyWith(color: theme.colorScheme.surface.withOpacity(0.5)),
            // border: const OutlineInputBorder(),
            focusedBorder: UnderlineInputBorder(
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
