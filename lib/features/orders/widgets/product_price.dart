import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class ProductPriceWidget extends StatelessWidget {
  final double price;
  const ProductPriceWidget({
    super.key,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white54,
      ),
      height: 50,
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Text(
              "\$ ${price.toStringAsFixed(2)}",
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
            ),
          ),
          Container(
            height: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Icon(
              IconsaxPlusLinear.bag,
              color: Colors.white,
              size: 20,
            ),
          )
        ],
      ),
    );
  }
}
