import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:real_estate_app_ui/business_logic/cubit/products_cubit.dart';
import 'package:real_estate_app_ui/presentation/screens/no_internet_screen.dart';
import 'package:real_estate_app_ui/presentation/widgets/shimmer_loading.dart';

import '../../constants/strings.dart';
import '../../data/models/product.dart';
import '../widgets/product_item.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  List<Product>? products = [];
  @override
  void initState() {
    super.initState();
    products = BlocProvider.of<ProductsCubit>(context).getProducts();
  }

  Widget buildBlocWidget() {
    return BlocBuilder<ProductsCubit, ProductsState>(builder: (context, state) {
      if (state is ProductsIsLoaded) {
        products = (state).products;
        return buildProductsListView();
      } else {
        return buildShimmerListView();
      }
    });
  }

  Widget buildProductsListView() {
    return ListView.builder(
      physics:const  BouncingScrollPhysics(),
        itemCount: products!.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: (){
              Navigator.pushNamed(context, singleProductDetailsScreen,arguments: products![index]);
            },
              child: ProductItem(product: products![index]));
        });
  }

  Widget buildShimmerListView() {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return const ShimmerLoading();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:
      OfflineBuilder(
      connectivityBuilder: (
      BuildContext context,
      ConnectivityResult connectivity,
      Widget child,
    ) {
        final bool connected = connectivity != ConnectivityResult.none;
        if(connected){
          return buildBlocWidget();
        }else{
         return const NoInternetScreen();
        }
      },
   child: const SizedBox(),
    )

    );
  }
}
