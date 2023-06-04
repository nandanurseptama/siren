import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:siren/cores/assets.dart';

class NotFoundScreen extends StatefulWidget {
  const NotFoundScreen({super.key});

  @override
  State<NotFoundScreen> createState() => _NotFoundScreenState();
}

class _NotFoundScreenState extends State<NotFoundScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: LayoutBuilder(builder: (context, constraints) {
        return Container(
          constraints: constraints,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(
            horizontal: 16
          ),
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: SvgPicture.asset(AssetImagePath.notFoundErrorAsset, fit: BoxFit.cover,),
          ),
        );
      })),
    );
  }
}
