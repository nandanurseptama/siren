import 'package:flutter/material.dart';
import 'package:siren/cores/widgets/shimmer_container.dart';

/// Creates Circle Profile Picture
///
/// [imageUrl] must be url
/// [diameter] diameter of circle profile picture. Default value is 50
class CircleProfilePictureWidget extends StatelessWidget {
  final String imageUrl;
  final double diameter;
  const CircleProfilePictureWidget(
      {super.key, required this.imageUrl, this.diameter = 50});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(diameter / 2),
      child: Image.network(
        imageUrl,
        height: diameter,
        width: diameter,
        errorBuilder: (context, error, stackTrace) {
          return _errorBuilder(context);
        },
        frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
          if (frame == null) {
            return _loadingBuilder(context);
          }
          return child;
        },
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _errorBuilder(BuildContext context) {
    return Container(
      height: diameter,
      width: diameter,
      alignment: Alignment.center,
      color: Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
      child: Icon(
        Icons.person,
        color: Theme.of(context).colorScheme.onPrimary,
      ),
    );
  }

  Widget _loadingBuilder(BuildContext context) {
    return Center(
      child: ShimmerContainer(
        size: Size(diameter, diameter),
        borderRadius: BorderRadius.circular(diameter / 2),
      ),
    );
  }

  factory CircleProfilePictureWidget.example(double size) {
    return CircleProfilePictureWidget(
        diameter: size,
        imageUrl:
            "https://storage.googleapis.com/boom-ai-images/results/0TlfUpI5YnMzVPRRD5nK/00001.jpg");
  }
}
