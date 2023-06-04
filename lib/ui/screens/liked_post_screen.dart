import 'package:flutter/widgets.dart';
import 'package:siren/cores/interfaces/states/base_state.dart';
import 'package:siren/features/post/domain/entity/post_entity.dart';
import 'package:siren/ui/widgets/liked_post_list_widget.dart';

class LikedPostScreen extends StatefulWidget {
  final BaseState<List<PostEntity>> postsState;
  final ValueChanged<String>? navigateToProfileScreen;
  const LikedPostScreen(
      {super.key, required this.postsState, this.navigateToProfileScreen});

  @override
  State<LikedPostScreen> createState() => _LikedPostScreenState();
}

class _LikedPostScreenState extends State<LikedPostScreen> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return LikedPostListWidget(
          postsState: widget.postsState,
          navigateToProfileScreen: widget.navigateToProfileScreen,
        );
      },
    );
  }
}
