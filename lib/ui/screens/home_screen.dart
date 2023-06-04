import 'package:flutter/material.dart';
import 'package:siren/cores/interfaces/states/pagination_state.dart';
import 'package:siren/features/post/domain/entity/post_entity.dart';
import 'package:siren/features/post/presentation/presenters/posts_presenter.dart';
import 'package:siren/ui/widgets/post_list_widget.dart';

class HomeScreen extends StatefulWidget {
  final PaginationState<PostEntity> postsState;
  final ValueChanged<String> navigateToProfileScreen;
  const HomeScreen(
      {super.key,
      required this.postsState,
      required this.navigateToProfileScreen});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  PostsPresenterState? get postsPresenterState {
    return context.findAncestorStateOfType<PostsPresenterState>();
  }

  void onLoad() {
    return postsPresenterState?.loadPosts();
  }
  @override
  Widget build(BuildContext context) {
    return PostListWidget(
        postsState: widget.postsState,
        navigateToProfileScreen: widget.navigateToProfileScreen, onLoad: onLoad,);
  }
}
