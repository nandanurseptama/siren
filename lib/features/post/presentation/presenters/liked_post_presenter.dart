import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siren/cores/interfaces/states/base_state.dart';
import 'package:siren/cores/utils/register_listener_fn.dart';
import 'package:siren/cores/widgets/presenter_widget.dart';
import 'package:siren/features/post/presentation/state_manager/liked_posts_cubit.dart';

class LikedPostPresenter extends PresenterWidget<BaseState<List<String>>> {
  final LikedPostsCubit likedPostsCubit;
  final Widget Function(
    BuildContext context,
    LikedPostPresenterState likedPostsPresenterState,
    BaseState<List<String>> likedPostsState,
  ) builder;
  const LikedPostPresenter(
      {super.key, required this.likedPostsCubit, required this.builder});

  @override
  LikedPostPresenterState createState() {
    return LikedPostPresenterState();
  }
}

class LikedPostPresenterState
    extends PresenterWidgetState<BaseState<List<String>>, LikedPostPresenter> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget.likedPostsCubit.call();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.likedPostsCubit,
      child: BlocConsumer<LikedPostsCubit, BaseState<List<String>>>(
        bloc: widget.likedPostsCubit,
        listener: (context, state) {
          return listener?.call(state);
        },
        builder: (context, state) {
          return widget.builder(context, this, state);
        },
      ),
    );
  }

  @override
  void setListener(ListenerFn<BaseState<List<String>>> listener) {
    if (!mounted) {
      return;
    }
    setState(() {
      this.listener = listener;
    });
    return;
  }

  void load() {
    widget.likedPostsCubit.call();
    return;
  }

  void likePost(String id) {
    widget.likedPostsCubit.like(id);
    return;
  }

  void dislikePost(String id) {
    widget.likedPostsCubit.dislike(id);
    return;
  }
}
