import 'package:real_estate_app_ui/data/models/product.dart';
import 'package:real_estate_app_ui/data/web_services/product_api.dart';

class ProductsRepository {
  final ProductsApi productsApi;

  ProductsRepository(this.productsApi);
  Future<List<Product>> getAllproducts() async {
    final products = await productsApi.getAllproducts();
    return products.map((product) => Product.fromJsonToObject(product)).toList();
  }
}
