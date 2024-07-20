import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:snack_ordering/blocs/products/products.dart';
import 'package:snack_ordering/extensions/widget.dart';

import '../../models/enums.dart';
import '../dashboard/widgets/bottom_cart.dart';
import 'widgets/category_hearder.dart';
import 'widgets/category_toggle.dart';
import 'package:swipable_stack/swipable_stack.dart';

import 'widgets/product_details.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  ProductCategory activeSelection = ProductCategory.choco;

  onCategoryChange(ProductCategory category) {
    setState(() {
      activeSelection = category;
    });
  }

  late final SwipableStackController _controller;

  void _listenController() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _controller = SwipableStackController()..addListener(_listenController);
  }

  @override
  void dispose() {
    super.dispose();
    _controller
      ..removeListener(_listenController)
      ..dispose();
  }

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CategoryHearder(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CategoryToggle(
                    isActive: activeSelection == ProductCategory.list,
                    category: ProductCategory.list,
                    // icon: Icons.abc_sharp,
                    onSelected: onCategoryChange,
                  ),
                  CategoryToggle(
                    isActive: activeSelection == ProductCategory.choco,
                    category: ProductCategory.choco,
                    icon: IconsaxPlusLinear.alarm,
                    onSelected: onCategoryChange,
                  ),
                  CategoryToggle(
                    isActive: activeSelection == ProductCategory.chips,
                    category: ProductCategory.chips,
                    icon: IconsaxPlusLinear.password_check,
                    onSelected: onCategoryChange,
                  ),
                  CategoryToggle(
                    isActive: activeSelection == ProductCategory.nono,
                    category: ProductCategory.nono,
                    icon: IconsaxPlusLinear.forward_item,
                    onSelected: onCategoryChange,
                  ),
                ],
              ).animatedLeft(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "${activeSelection.name} ",
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        const Text(
                          "Collections",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_forward),
                    )
                  ],
                ),
              ).animatedLeft(),
              BlocBuilder<ProductsBloc, ProductsState>(
                builder: (context, state) {
                  return Expanded(
                    child: Positioned.fill(
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: SwipableStack(
                          detectableSwipeDirections: const {
                            SwipeDirection.right,
                            SwipeDirection.left,
                          },
                          itemCount: state.data.length,
                          controller: _controller,
                          stackClipBehaviour: Clip.none,
                          onSwipeCompleted: (index, direction) {
                            print('$index, $direction');
                          },
                          horizontalSwipeThreshold: 0.8,
                          verticalSwipeThreshold: 0.8,
                          builder: (context, properties) {
                            final itemIndex =
                                properties.index % state.data.length;
                            return Stack(
                              children: [
                                ProductDetails(
                                  product: state.data[itemIndex],
                                )
                              ],
                            );
                          },
                        ),
                      ),
                    ).animatedLeft()
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomCartWidget(),
    );
  }
}
