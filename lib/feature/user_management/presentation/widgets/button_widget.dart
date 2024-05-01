import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.child,
    this.onPressed,
    this.padding,
  });

  final Widget child;
  final Function()? onPressed;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(
          Theme.of(context).colorScheme.onPrimary,
        ),
        padding: MaterialStatePropertyAll(
          padding ??
              const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 15,
              ),
        ),
      ),
      child: child,
    );
  }
}
