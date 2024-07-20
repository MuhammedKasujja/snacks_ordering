part of 'cart_bloc.dart';

final class CartState extends Equatable {
  final String? error;
  final String? message;
  final AppState status;
  final List<ProductModel> data;

  const CartState({
    this.error,
    this.message,
    required this.status,
    required this.data,
  });

  factory CartState.init() {
    return const CartState(
      status: AppState.initial,
      data: [],
    );
  }

  CartState load() {
    return CartState(
      data: data,
      status: AppState.loading,
    );
  }

  CartState loaded({
    String? message,
    List<ProductModel>? data,
  }) {
    return CartState(
      message: message,
      data: data ?? this.data,
      status: AppState.success,
    );
  }

  CartState failure({
    required String error,
  }) {
    return CartState(
      error: error,
      data: data,
      status: AppState.failure,
    );
  }

  @override
  List<Object?> get props => [
        message,
        error,
        status,
        data,
      ];
}
