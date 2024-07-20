import 'package:flutter/material.dart';
import 'package:snack_ordering/theme/colors.dart';

class CartCounter extends StatefulWidget {
  final double price;
  const CartCounter({super.key, required this.price});

  @override
  State<CartCounter> createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            setState(() {
              count++;
            });
          },
          icon: const CircleAvatar(
              backgroundColor: Colors.white, child: Icon(Icons.add)),
        ),
        Column(
          children: [
            Text(
              "$count",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: kPrimaryColor,
              ),
              child: Text(
                "\$ ${(count * widget.price).toStringAsFixed(2)}",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        IconButton(
          onPressed: () {
            setState(() {
              if (count > 1) {
                count--;
              }
            });
          },
          icon: const CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(Icons.remove),
          ),
        )
      ],
    );
  }
}
