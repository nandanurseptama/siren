import 'package:flutter/material.dart';
import 'package:siren/cores/widgets/shimmer_container.dart';
import 'package:siren/ui/widgets/user_post_widget_shimmer.dart';

class ProfileScreenShimmer extends StatelessWidget {
  const ProfileScreenShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            searchFieldShimmer(context, constraints),
            headerShimmer(constraints),
            genderShimmer(constraints),
            phoneShimmer(constraints),
            locationShimmer(constraints),
            buttonShimmer(constraints),
            const SizedBox(
              height: 16,
            ),
            const Divider(),
            const SizedBox(
              height: 8,
            ),
            ...userPostsShimmer()
          ],
        ),
      );
    });
  }

  Widget Function(BuildContext context, BoxConstraints constraints)
      get searchFieldShimmer {
    return (context, constraints) {
      return Padding(
        padding:
            const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
        child: ShimmerContainer(
          size: Size(constraints.maxWidth - 32, 50),
          borderRadius: BorderRadius.circular(8),
        ),
      );
    };
  }

  Widget headerShimmer(BoxConstraints constraints) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          profilePictureShimmer(),
          const SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 8,
              ),
              emailShimmer(),
              const SizedBox(
                height: 16,
              ),
              nameShimmer(constraints.copyWith(
                minWidth: 0,
                maxWidth: constraints.maxWidth - 80 - 32 - 16,
              )),
            ],
          )
        ],
      ),
    );
  }

  Widget profilePictureShimmer() {
    return ShimmerContainer(
      size: const Size(80, 80),
      borderRadius: BorderRadius.circular(40),
    );
  }

  Widget emailShimmer() {
    return ShimmerContainer(
      size: const Size(120, 14),
      borderRadius: BorderRadius.circular(4),
    );
  }

  Widget nameShimmer(BoxConstraints constraints) {
    return ShimmerContainer(
      size: Size(constraints.maxWidth * 0.8, 14),
      borderRadius: BorderRadius.circular(4),
    );
  }

  Widget genderShimmer(BoxConstraints parentConstraints) {
    var constraints = parentConstraints.copyWith(
        minWidth: 0, maxWidth: parentConstraints.maxWidth - 32);
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
      child: ShimmerContainer(
        size: Size(constraints.maxWidth * 0.2, 12),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }

  Widget phoneShimmer(BoxConstraints parentConstraints) {
    var constraints = parentConstraints.copyWith(
        minWidth: 0, maxWidth: parentConstraints.maxWidth - 32);
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
      child: ShimmerContainer(
        size: Size(constraints.maxWidth * 0.3, 12),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }

  Widget locationShimmer(BoxConstraints parentConstraints) {
    var constraints = parentConstraints.copyWith(
        minWidth: 0, maxWidth: parentConstraints.maxWidth - 32);
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShimmerContainer(
            size: Size(constraints.maxWidth, 12),
            borderRadius: BorderRadius.circular(4),
          ),
          const SizedBox(
            height: 4,
          ),
          ShimmerContainer(
            size: Size(constraints.maxWidth * 0.4, 12),
            borderRadius: BorderRadius.circular(4),
          )
        ],
      ),
    );
  }

  Widget buttonShimmer(BoxConstraints parentConstraints) {
    var constraints = parentConstraints.copyWith(
        minWidth: 0, maxWidth: parentConstraints.maxWidth - 32);
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
      child: ShimmerContainer(
        size: Size(constraints.maxWidth, 40),
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
  List<Widget> userPostsShimmer(){
    return List.generate(20, (index){
      return UserPostWidgetShimmer();
    });
  }
}
