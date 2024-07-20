import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:snack_ordering/gen/assets.gen.dart';
import 'package:snack_ordering/models/enums.dart';
import 'package:snack_ordering/models/product.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(ProductsState.init()) {
    on<FetchProducts>((event, emit) async {
      emit(state.load());
      final products = generateProducts();
      emit(
        state.loaded(
          message: "Data loaded",
          data: products,
        ),
      );
    });
  }
}

List<ProductModel> generateProducts([int count = 30]) {
  List<ProductModel> list = [];
  for (var i = 0; i < count; i++) {
    list.add(
      ProductModel(
        id: 'p-$i',
        category: faker.food.cuisine(),
        subCategory: faker.lorem.word(),
        name: faker.food.dish(),
        price: faker.randomGenerator.decimal(min: 0, scale: 20.0),
        image:
            "https://img.freepik.com/free-photo/pretzels-chips-crackers-popcorn-bowls_114579-6490.jpg?w=826&t=st=1721311973~exp=1721312573~hmac=1b55b7df11710661078b791002b0eda5f067924a87b64e02e88edb17a40bfb5a", //faker.image.image(keywords: ["snacks"]),
        bgColor: const Color.fromARGB(255, 241, 223, 159),
        icon: IconsaxPlusLinear.bag,
        mainPicture: Assets.chipsGreen.path,
      ),
    );
  }
  return list;
}
