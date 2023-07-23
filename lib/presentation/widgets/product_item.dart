import 'package:flutter/material.dart';

import '../../data/models/product.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 1, color: Colors.grey.shade200),
          borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Hero(
              tag: product.image,
              child: product.image.isNotEmpty
                  ? FadeInImage(
                      fit: BoxFit.cover,
                      width: 150,
                      height: 200,
                      placeholder:
                          const AssetImage('assets/images/loading.gif'),
                      image: NetworkImage(product.image),
                    )
                  : Image.asset('assets/images/house1.jpeg')),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  product.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 18),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  product.rating.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 18),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  product.category,
                  style: const TextStyle(
                      fontWeight: FontWeight.w200, fontSize: 18),
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}
