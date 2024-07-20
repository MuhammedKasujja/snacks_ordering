import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:snack_ordering/models/enums.dart';
import 'package:snack_ordering/models/product.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState.init()) {
    on<AddProductToCart>((event, emit) async {
      emit(state.load());
      final products = [...state.data];
      products.add(event.product);
      emit(
        state.loaded(
          message: "Data loaded",
          data: products,
        ),
      );
    });
  }
}
