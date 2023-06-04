import 'package:flutter/material.dart';
import 'package:siren/cores/widgets/shimmer_container.dart';

class ImageNetworkWidget extends StatelessWidget {
  final double aspectRatio;
  final String? imageUrl;
  const ImageNetworkWidget(
      {super.key,
      this.imageUrl,
      this.aspectRatio = 1});

  @override
  Widget build(BuildContext context) {
    return _banner();
  }

  Widget _banner() {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: LayoutBuilder(builder: (context, constraints) {
        if (imageUrl == null) {
          return _placeHolder(constraints);
        }
        return SizedBox(
          height: constraints.maxHeight,
          width: constraints.maxWidth,
          child: Image.network(
            imageUrl!,
            errorBuilder: (context, error, stackTrace) {
              return _errorBuilder(context);
            },
            frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
              if (frame == null) {
                return _placeHolder(constraints);
              }
              return child;
            },
            fit: BoxFit.cover,
          ),
        );
      }),
    );
  }

  Widget _placeHolder(BoxConstraints constraints) {
    return ShimmerContainer(
      size: constraints.biggest,
    );
  }

  Widget _errorBuilder(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
    );
  }
}
