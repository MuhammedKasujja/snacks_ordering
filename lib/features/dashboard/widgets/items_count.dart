import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:snack_ordering/extensions/widget.dart';

class ItemsCount extends StatelessWidget {
  final int count;
  const ItemsCount({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    '$count',
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  const Text('items')
                ],
              ),
              const Icon(
                Iconsax.setting_4,
                size: 20,
              )
            ],
          ),
        ),
      ],
    ).animatedRight();
  }
}
