import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:snack_ordering/features/cart/cart.dart';
import 'package:snack_ordering/theme/colors.dart';

class CartAddWidget extends StatelessWidget {
  const CartAddWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CartScreen(),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 0.3,
          shadowColor: Colors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Container(
            width: double.maxFinite,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
            ),
            height: 65,
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: Text(
                    "Add to Cart",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                ),
                Container(
                  height: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 30),
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: const Icon(
                    IconsaxPlusLinear.bag_happy,
                    color: Colors.black,
                    size: 20,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
