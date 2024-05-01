import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String message) {
  final theme = Theme.of(context);
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        backgroundColor: theme.colorScheme.secondary,
        content: Text(message),
      ),
    );
}
