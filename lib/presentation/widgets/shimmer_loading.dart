import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading extends StatelessWidget {
  const ShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 1, color: Colors.grey.shade200),
            borderRadius: BorderRadius.circular(15)),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Row(children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 150,
                      height: 20,
                      child: Container(color: Colors.white),
                    ),
                    const SizedBox(height: 10.0),
                    SizedBox(
                      width: 100,
                      height: 20,
                      child: Container(color: Colors.white),
                    ),
                    const SizedBox(height: 10.0),
                    SizedBox(
                      width: 80,
                      height: 20,
                      child: Container(color: Colors.white),
                    ),
                  ],
                ),
              ),
            )
          ]),
        ));
  }
}
