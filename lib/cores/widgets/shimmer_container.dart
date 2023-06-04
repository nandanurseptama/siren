import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerContainer extends StatelessWidget {
  final Size size;
  final BorderRadius? borderRadius;
  const ShimmerContainer({super.key, required this.size, this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).colorScheme.outline,
      highlightColor: Theme.of(context).colorScheme.onSecondary,
      enabled: true,
      child: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
        ),
      ),
    );
  }
}
