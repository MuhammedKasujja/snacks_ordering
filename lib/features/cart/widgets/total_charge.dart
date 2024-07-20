import 'package:flutter/material.dart';
import 'package:snack_ordering/extensions/widget.dart';
import 'package:snack_ordering/theme/colors.dart';

class TotalChargeWidget extends StatelessWidget {
  final double total;
  const TotalChargeWidget({super.key, required this.total});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Delivery Amount'),
                Text(
                  "\$04.00",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Divider(),
            const SizedBox(height: 12),
            const Text(
              "Total Amount",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Text(
              "USD ${total.toStringAsFixed(2)}",
              style: const TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    ).animatedLeft(400);
  }
}
