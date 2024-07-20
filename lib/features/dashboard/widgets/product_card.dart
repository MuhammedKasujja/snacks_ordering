import 'package:flutter/material.dart';
import 'package:snack_ordering/models/product.dart';

import 'price_widget.dart';

class ProductCard extends StatefulWidget {
  final ProductModel product;
  final Function() addToCart;
  const ProductCard({
    super.key,
    required this.product,
    required this.addToCart,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool _isVisible = true;

  void _toggleVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
    if (!_isVisible) {
      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          _isRemoved = true;
        });
        widget.addToCart();
      });
    }
  }

  bool _isRemoved = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleVisibility,
      child: _isRemoved
          ? Container() // Empty container to take place of the removed widget
          : AnimatedOpacity(
              opacity: _isVisible ? 1.0 : 0.0,
              duration: const Duration(seconds: 1),
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(30),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(widget.product.image!),
                    fit: BoxFit.cover,
                  ),
                  color: widget.product.bgColor,
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
                      widget.product.category,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      widget.product.subCategory,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.white,
                      ),
                      child: Text(
                        widget.product.name,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                    const Spacer(),
                    PriceWidget(
                      price: widget.product.price,
                      icon: widget.product.icon,
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
