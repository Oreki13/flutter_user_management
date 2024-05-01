import 'package:flutter/material.dart';

class FilterButtonWidget extends StatelessWidget {
  final String name;
  final VoidCallback? onPressed;

  const FilterButtonWidget({
    super.key,
    required this.name,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(theme.colorScheme.primary),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: theme.textTheme.bodyLarge!.copyWith(
              color: theme.colorScheme.surface,
            ),
          ),
          Icon(
            Icons.sort_by_alpha_rounded,
            color: theme.colorScheme.surface,
          ),
        ],
      ),
    );
  }
}
