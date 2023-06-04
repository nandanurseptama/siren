import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siren/cores/interfaces/states/base_state.dart';
import 'package:siren/cores/interfaces/states/pagination_state.dart';
import 'package:siren/cores/utils/register_listener_fn.dart';
import 'package:siren/cores/widgets/presenter_widget.dart';
import 'package:siren/features/post/domain/entity/post_entity.dart';
import 'package:siren/features/post/presentation/state_manager/posts_cubit.dart';

class PostsPresenter extends PresenterWidget<PaginationState<PostEntity>> {
  final PostsCubit postsCubit;
  final BaseState<List<PostEntity>> likedPostsState;
  final Widget Function(
    BuildContext context,
    PostsPresenterState postsPresenterState,
    PaginationState<PostEntity> postsState,
    BaseState<List<PostEntity>> likedPostsState,
  ) builder;
  const PostsPresenter(
      {super.key,
      required this.postsCubit,
      required this.builder,
      required this.likedPostsState});

  @override
  PostsPresenterState createState() {
    return PostsPresenterState();
  }
}

class PostsPresenterState
    extends PresenterWidgetState<PaginationState<PostEntity>, PostsPresenter> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.postsCubit,
      child: BlocConsumer<PostsCubit, PaginationState<PostEntity>>(
        bloc: widget.postsCubit,
        listener: (context, state) {
          return listener?.call(state);
        },
        builder: (context, state) {
          return widget.builder(
            context,
            this,
            state,
            widget.likedPostsState,
          );
        },
      ),
    );
  }

  @override
  void setListener(ListenerFn<PaginationState<PostEntity>> listener) {
    if (!mounted) {
      return;
    }
    setState(() {
      this.listener = listener;
    });
    return;
  }

  void loadPosts({String userId = ""}) async {
    await widget.postsCubit.call(userId: userId);
    return;
  }

  bool isLiked(String id) {
    var datas = widget.likedPostsState.data ?? [];
    var indexWhere = datas.indexWhere((element) => element.id == id);
    return indexWhere > -1;
  }
}
