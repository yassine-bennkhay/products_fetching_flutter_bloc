part of 'products_cubit.dart';

@immutable
abstract class ProductsState {}

class ProductsInitial extends ProductsState {}

class ProductsIsLoaded extends ProductsState {
  final List<Product> products;

  ProductsIsLoaded(this.products);
}
