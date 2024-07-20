import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snack_ordering/blocs/cart/cart_bloc.dart';
import 'package:snack_ordering/extensions/widget.dart';
import 'widgets/cart_header.dart';
import 'widgets/make_payment.dart';
import 'widgets/product_item.dart';
import 'widgets/total_charge.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 16.0,
          ),
          child: BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CartHeader(count: state.data.length),
                  const SizedBox(height: 10),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35),
                          topRight: Radius.circular(35),
                        ),
                        color: Colors.black,
                      ),
                      padding: const EdgeInsets.only(top: 20),
                      child: ListView.builder(
                        itemCount: state.data.length,
                        itemBuilder: (context, index) {
                          return ProductItem(product: state.data[index])
                              .animate()
                              .custom(
                                delay: Duration(milliseconds: index * 100),
                                duration: 200.ms,
                                builder: (context, value, child) =>
                                    Transform.translate(
                                  offset: Offset(200 - (200 * value), 0),
                                  child: Opacity(
                                    opacity: value,
                                    child: child,
                                  ),
                                ),
                              );
                        },
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.black,
                    child: Column(
                      children: [
                        const SizedBox(height: 16),
                        TotalChargeWidget(
                          total: state.data
                              .map((p) => p.price)
                              .reduce((sum, price) => sum + price),
                        ),
                        const SizedBox(height: 12),
                        const MakePayment().animatedBottom(600),
                      ],
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
