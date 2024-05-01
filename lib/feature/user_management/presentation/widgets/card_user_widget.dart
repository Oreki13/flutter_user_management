import 'package:flutter/material.dart';

class CardUserWidget extends StatelessWidget {
  final String name;
  final String email;
  final String phoneNumber;
  final String city;
  final String address;

  const CardUserWidget({
    super.key,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.city,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      title: Text(
        name,
        style: theme.textTheme.bodyLarge!.copyWith(
          fontWeight: FontWeight.w700,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 8,
          ),
          Text(
            "Contact",
            style: theme.textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.w500,
              color: theme.colorScheme.onSecondary,
            ),
          ),
          Row(
            children: [
              Text(
                email,
                style: theme.textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                " | ",
                style: theme.textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                phoneNumber,
                style: theme.textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "Address",
            style: theme.textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.w500,
              color: theme.colorScheme.onSecondary,
            ),
          ),
          Row(
            children: [
              Text(
                city,
                style: theme.textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                " | ",
                style: theme.textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                address,
                style: theme.textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
      isThreeLine: true,
      tileColor: theme.colorScheme.secondary,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
    );
  }
}
