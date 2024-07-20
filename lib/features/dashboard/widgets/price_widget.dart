import 'package:flutter/material.dart';

class PriceWidget extends StatelessWidget {
  final double price;
  final IconData icon;
  const PriceWidget({super.key, required this.price, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white54,
      ),
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Text(
              "\$ ${price.toStringAsFixed(2)}",
              style: const TextStyle(fontWeight: FontWeight.w400),
            ),
          ),
          Container(
            // height: double.maxFinite,
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 12,
            ),
          )
        ],
      ),
    );
  }
}
