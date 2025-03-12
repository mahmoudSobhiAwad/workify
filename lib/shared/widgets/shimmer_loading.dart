import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmerList extends StatelessWidget {
  const CustomShimmerList({
    super.key,
    this.length = 7,
    this.itemHeight = 120,
    this.margin,
  });
  final int length;
  final double itemHeight;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: length,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            margin: margin ??
                const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            height: itemHeight,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        );
      },
    );
  }
}

class ShimmerGrid extends StatelessWidget {
  const ShimmerGrid({super.key, this.counts, this.shape, this.raduis});
  final int? counts;
  final BoxShape? shape;
  final double? raduis;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 150,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1,
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            decoration: BoxDecoration(
              shape: shape ?? BoxShape.rectangle,
              color: Colors.white,
              borderRadius:
                  shape == BoxShape.circle ? null : BorderRadius.circular(10),
            ),
          ),
        );
      },
    );
  }
}
