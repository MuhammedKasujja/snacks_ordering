import 'package:flutter/material.dart';
import 'package:snack_ordering/models/product.dart';

class CartItems extends StatelessWidget {
  final List<ProductModel> products;
  const CartItems({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < products.length; i++)
              Container(
                margin: const EdgeInsets.symmetric(vertical: 0),
                child: Align(
                  widthFactor: 0.5,
                  child: CircleAvatar(
                    radius: 27,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(
                        products[i].image ?? '',
                      ),
                    ),
                  ),
                ),
              )
          ],
        ),
        // const SizedBox(width: 20),
        // CircleAvatar(
        //   backgroundColor: Colors.grey.shade200,
        //   radius: 20,
        //   child: const Center(child: Icon(Icons.add)),
        // ),
      ],
    );
  }
}
