part of 'products_bloc.dart';

class ProductsState extends Equatable {
  final String? error;
  final String? message;
  final AppState status;
  final List<ProductModel> data;

  const ProductsState({
    this.error,
    this.message,
    required this.status,
    required this.data,
  });

  factory ProductsState.init() {
    return const ProductsState(
      status: AppState.initial,
      data: [],
    );
  }

  ProductsState load() {
    return ProductsState(
      data: data,
      status: AppState.loading,
    );
  }

  ProductsState loaded({
    String? message,
    List<ProductModel>? data,
  }) {
    return ProductsState(
      message: message,
      data: data ?? this.data,
      status: AppState.success,
    );
  }

  ProductsState failure({
    required String error,
  }) {
    return ProductsState(
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
