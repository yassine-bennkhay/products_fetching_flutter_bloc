import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate_app_ui/business_logic/cubit/products_cubit.dart';
import 'package:real_estate_app_ui/data/repositories/products_repository.dart';
import 'package:real_estate_app_ui/data/web_services/product_api.dart';
import 'package:real_estate_app_ui/presentation/screens/home_screen.dart';
import 'package:real_estate_app_ui/presentation/screens/products_screen.dart';

import 'data/models/product.dart';
import 'presentation/screens/product_details_screen.dart';

import 'constants/strings.dart';

class AppRoutes {
  late ProductsRepository productsRepository;
  late ProductsCubit productsCubit;
  AppRoutes() {
    productsRepository = ProductsRepository(ProductsApi());
    productsCubit = ProductsCubit(productsRepository);
  }
  Route? generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      
      case productsScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: productsCubit,
            child: const HomeScreen(),
          ),
        );
      case singleProductDetailsScreen:
        final product=settings.arguments as Product;
        return MaterialPageRoute(builder: (_) =>  ProductDetailsScreen(product: product,));
    }
    return null;
  }
}
