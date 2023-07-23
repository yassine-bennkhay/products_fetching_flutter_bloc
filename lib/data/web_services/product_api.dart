import 'package:dio/dio.dart';

import 'package:real_estate_app_ui/constants/strings.dart';

class ProductsApi {
  late Dio dio;
  ProductsApi() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> getAllproducts() async {
    try {
      Response response = await dio.get('products');

      return response.data;
    } catch (e) {
      return [];
    }
  }
}
