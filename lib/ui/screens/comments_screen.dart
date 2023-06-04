import 'package:flutter/material.dart';
import 'package:siren/cores/interfaces/states/pagination_state.dart';
import 'package:siren/features/post/domain/entity/comment_entity.dart';
import 'package:siren/features/post/domain/entity/post_entity.dart';
import 'package:siren/features/post/presentation/presenters/comments_presenter.dart';
import 'package:siren/ui/widgets/comment_list_item.dart';

class CommentsScreen extends StatefulWidget {
  static String routeName = "/comments";
  final PostEntity post;
  final PaginationState<CommentEntity> commentsState;
  const CommentsScreen(
      {super.key, required this.commentsState, required this.post});

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      load();
    });
  }
  load(){
    var ancestorState = context.findAncestorStateOfType<CommentsPresenterState>();
    return ancestorState?.loadComments(widget.post.id);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Comments"),
        automaticallyImplyLeading: true,
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return CommentListItem(
                comments: widget.commentsState, postId: widget.post.id);
          },
        ),
      ),
    );
  }
}
