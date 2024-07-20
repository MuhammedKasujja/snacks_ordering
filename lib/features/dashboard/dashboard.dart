import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snack_ordering/blocs/cart/cart_bloc.dart';
import 'package:snack_ordering/blocs/products/products_bloc.dart';
import 'package:snack_ordering/features/dashboard/widgets/header.dart';
import 'package:snack_ordering/features/orders/orders.dart';

import 'widgets/bottom_cart.dart';
import 'widgets/items_count.dart';
import 'widgets/products_list.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 24.0,
            left: 16,
            right: 16,
          ),
          child: BlocBuilder<ProductsBloc, ProductsState>(
            builder: (context, state) {
              return Column(
                children: [
                  const MainHeader(),
                  Expanded(
                    child: Flex(
                      direction: Axis.horizontal,
                      children: [
                        Flexible(
                          flex: 1,
                          child: ProductsList(
                            products: state.data.take(15).toList(),
                            delay: 300,
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Flexible(
                          flex: 1,
                          child: Column(
                            children: [
                              ItemsCount(
                                count: state.data.length,
                              ),
                              Expanded(
                                child: ProductsList(
                                  products: state.data.skip(15).toList(),
                                  delay: 500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          return state.data.isNotEmpty
              ? InkWell(
                  child: const BottomCartWidget(),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OrdersScreen(),
                      ),
                    );
                  },
                )
              : const SizedBox.shrink();
        },
      ),
    );
  }
}
