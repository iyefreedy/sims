import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerGridLoading extends StatelessWidget {
  const ShimmerGridLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 20.0,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        itemBuilder: (_, __) => Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Container(
            height: 50.0,
            width: 50.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.white,
            ),
          ),
        ),
        itemCount: 8,
      ),
    );
  }
}
