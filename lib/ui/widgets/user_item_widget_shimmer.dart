import 'package:flutter/material.dart';
import 'package:siren/cores/widgets/shimmer_container.dart';

class UserItemWidgetShimmer extends StatelessWidget {
  const UserItemWidgetShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        width: constraints.maxWidth,
        height: 70,
        alignment: Alignment.center,
        decoration:
            const BoxDecoration(border: Border(bottom: BorderSide(width: 0.9))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _profilePicture(),
            const SizedBox(
              width: 16,
            ),
            Expanded(child: name())
          ],
        ),
      );
    });
  }

  Widget name() {
    return ShimmerContainer(
      size: const Size(120, 14),
      borderRadius: BorderRadius.circular(4),
    );
  }

  Widget _profilePicture() {
    return ShimmerContainer(
      size: const Size(40,40),
      borderRadius: BorderRadius.circular(20),
    );
  }
}
