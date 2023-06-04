import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siren/cores/interfaces/states/pagination_state.dart';
import 'package:siren/cores/utils/register_listener_fn.dart';
import 'package:siren/cores/widgets/presenter_widget.dart';
import 'package:siren/features/post/domain/entity/comment_entity.dart';
import 'package:siren/features/post/presentation/state_manager/comments_cubit.dart';

class CommentsPresenter
    extends PresenterWidget<PaginationState<CommentEntity>> {
  final CommentsCubit commentsCubit;
  final Widget Function(
    BuildContext context,
    CommentsPresenterState commentsPresenterState,
    PaginationState<CommentEntity> commentsState,
  ) builder;
  const CommentsPresenter({
    super.key,
    required this.commentsCubit,
    required this.builder,
  });

  @override
  CommentsPresenterState createState() {
    return CommentsPresenterState();
  }
}

class CommentsPresenterState extends PresenterWidgetState<
    PaginationState<CommentEntity>, CommentsPresenter> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.commentsCubit,
      child: BlocConsumer<CommentsCubit, PaginationState<CommentEntity>>(
        bloc: widget.commentsCubit,
        listener: (context, state) {
          return listener?.call(state);
        },
        builder: (context, state) {
          return widget.builder(
            context,
            this,
            state,
          );
        },
      ),
    );
  }

  @override
  void setListener(ListenerFn<PaginationState<CommentEntity>> listener) {
    if (!mounted) {
      return;
    }
    setState(() {
      this.listener = listener;
    });
    return;
  }

  void loadComments(String postId) async {
    await widget.commentsCubit.call(postId);
    return;
  }

  void addComment(String message, String postId) {
    if (message.isEmpty) {}
    widget.commentsCubit.createComment(message: message, postId: postId);
    return;
  }

  void reset() {
    widget.commentsCubit.reset();
    return;
  }
}
