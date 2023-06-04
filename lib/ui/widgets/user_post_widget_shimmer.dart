import 'package:flutter/material.dart';
import 'package:siren/cores/widgets/shimmer_container.dart';

class UserPostWidgetShimmer extends StatelessWidget {
  const UserPostWidgetShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16, bottom: 16),
      decoration: BoxDecoration(
          border: Border(
        bottom: BorderSide(
            color: Theme.of(context).colorScheme.outline, width: 0.3),
      )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _profilePictureAndName(),
          const SizedBox(
            height: 16,
          ),
          _imageShimmer(),
          const SizedBox(
            height: 16,
          ),
          _textShimmer(),
        ],
      ),
    );
  }

  Widget _profilePictureAndName() {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        constraints: constraints,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            ShimmerContainer(
              size: const Size(40, 40),
              borderRadius: BorderRadius.circular(20),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: ShimmerContainer(
                size: Size(constraints.maxWidth, 12),
                borderRadius: BorderRadius.circular(4),
              ),
            )
          ],
        ),
      );
    });
  }

  Widget _imageShimmer() {
    return AspectRatio(
        aspectRatio: 1,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return ShimmerContainer(size: constraints.biggest);
          },
        ));
  }

  Widget _textShimmer() {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShimmerContainer(
              size: Size((constraints.maxWidth - 112) * 0.8, 10),
              borderRadius: BorderRadius.circular(4),
            ),
            const SizedBox(
              height: 4,
            ),
            ShimmerContainer(
              size: Size((constraints.maxWidth - 32) * 0.3, 10),
              borderRadius: BorderRadius.circular(4),
            ),
            const SizedBox(
              height: 4,
            ),
            ShimmerContainer(
              size: Size((constraints.maxWidth - 32) * 0.5, 10),
              borderRadius: BorderRadius.circular(4),
            ),
          ],
        ),
      );
    });
  }
}
