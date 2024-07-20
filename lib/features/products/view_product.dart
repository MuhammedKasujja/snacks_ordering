import 'package:flutter/material.dart';
import 'package:snack_ordering/extensions/widget.dart';
import 'package:snack_ordering/features/products/widgets/cart_add.dart';
import 'package:snack_ordering/features/products/widgets/product_header.dart';
import 'package:snack_ordering/models/product.dart';

import 'widgets/cart_counter.dart';

class ViewProductScreen extends StatelessWidget {
  final ProductModel product;
  const ViewProductScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFAFDFCFA),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 24.0,
            left: 16,
            right: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductHearder(category: product.category).animatedBack(150),
              Text(product.name).animatedBack(),
              const SizedBox(
                height: 18,
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Image.asset(
                    product.mainPicture,
                  ),
                ),
              ).animatedBack(300),
              // Container(
              //   decoration: BoxDecoration(
              //     borderRadius: const BorderRadius.only(
              //       topLeft: Radius.circular(30),
              //       topRight: Radius.circular(20),
              //       bottomLeft: Radius.circular(20),
              //       bottomRight: Radius.circular(30),
              //     ),
              //     image: DecorationImage(
              //       image: NetworkImage(product.image!),
              //       fit: BoxFit.cover,
              //     ),
              //   ),
              // ),
              const SizedBox(
                height: 18,
              ),
              CartCounter(
                price: product.price,
              ).animatedBack(500),
              const SizedBox(
                height: 18,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CartAddWidget().animatedBack(700),
    );
  }
}
