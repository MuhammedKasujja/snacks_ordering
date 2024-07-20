import 'package:flutter/material.dart';
import 'package:snack_ordering/models/product.dart';

import '../../products/view_product.dart';
import 'product_price.dart';

class ProductDetails extends StatelessWidget {
  final ProductModel product;

  const ProductDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ViewProductScreen(product: product),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(30),
          ),
          image: DecorationImage(
            image: NetworkImage(product.image!),
            fit: BoxFit.cover,
          ),
          color: product.bgColor,
        ),
        padding: const EdgeInsets.only(
          bottom: 8,
          left: 16,
          right: 16,
          top: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.category,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
            Text(
              product.subCategory,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.white,
              ),
              child: Text(
                product.name,
                style: const TextStyle(fontSize: 12),
              ),
            ),
            const Spacer(),
            ProductPriceWidget(price: product.price),
            const SizedBox(height: 6),
          ],
        ),
      ),
    );
  }
}
