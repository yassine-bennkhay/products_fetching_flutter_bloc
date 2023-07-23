import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:real_estate_app_ui/data/repositories/products_repository.dart';

import '../../data/models/product.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  late List<Product> products = [];
  final ProductsRepository productsRepository;
  ProductsCubit(this.productsRepository) : super(ProductsInitial());
  List<Product> getProducts() {
    productsRepository.getAllproducts().then((products) {
      emit(ProductsIsLoaded(products));
      this.products = products;
    });
    return products;
  }
}
