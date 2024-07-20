import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snack_ordering/blocs/cart/cart_bloc.dart';
import 'package:snack_ordering/models/product.dart';

import 'product_card.dart';

class ProductsList extends StatelessWidget {
  final List<ProductModel> products;
  final int delay;
  const ProductsList({
    super.key,
    required this.products,
    required this.delay,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: products.length,
      itemBuilder: (BuildContext context, int index) {
        return ProductCard(
          product: products[index],
          addToCart: () {
            context
                .read<CartBloc>()
                .add(AddProductToCart(product: products[index]));
          },
        );
      },
      separatorBuilder: (BuildContext context, int index) => const SizedBox(
        height: 12,
      ),
    ).animate().custom(
          delay: Duration(milliseconds: delay),
          duration: 150.ms,
          builder: (context, value, child) => Transform.translate(
            offset: Offset(0, 200 - (200 * value)),
            child: Opacity(
              opacity: value,
              child: child,
            ),
          ),
        );
  }
}
