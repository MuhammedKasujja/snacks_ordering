import 'package:flutter/material.dart';
import 'package:snack_ordering/models/product.dart';

class ProductItem extends StatelessWidget {
  final ProductModel product;
  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(product.image!),
        radius: 30,
      ),
      title: Text(
        product.name,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(product.category, style: const TextStyle(
          color: Colors.grey,
        ),),
      trailing: Chip(
        label: Text("\$${product.price.toStringAsFixed(2)}"),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
