import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../constants/strings.dart';
import '../../data/models/product.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Product product;
   const ProductDetailsScreen({super.key,required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: SingleChildScrollView(
        physics:const  BouncingScrollPhysics(),
        child: Column(children: [
          Hero(
            tag: widget.product.title,
            child: Image(
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                image: NetworkImage(widget.product.image)),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Row(

                  children: [
                  Expanded(child: Text(widget.product.title,style: TextStyle(fontWeight: FontWeight.w900),)),
                    Text("\$${widget.product.price.toString()}",style: TextStyle(fontWeight: FontWeight.w900)),
                ],

                ),
                const SizedBox(height: 10,),
                Row(

                  children: [
                    Expanded(child: Text("Reviews",style: TextStyle(fontWeight: FontWeight.w900),)),
                    Row(
                      children: [
                        RatingBarIndicator(

                          rating: widget.product.rating.rate,
                          itemBuilder: (context, index) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          itemCount: 5,
                          itemSize: 20.0,
                          direction: Axis.horizontal,
                        ),
                        Text("${widget.product.rating.rate} "),
                        Text("(${widget.product.rating.count} Reviews)")
                      ],
                    ),
                  ],

                ),
               const SizedBox(height: 10,),
                const Align(alignment: Alignment.centerLeft,child: Text("Description:",style: TextStyle(fontWeight: FontWeight.w700)),),
                Text(widget.product.description),
              ],
            ),
          ),


        ],),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
              onPressed: () async {
              },
              style: ElevatedButton.styleFrom(


backgroundColor: AppColors.primaryColor,
                shape: const RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.all(Radius.circular(10))),
              ),
              child: const  Text(
               "Add to Cart"
              )),
        ),
      ),
    );
  }
}