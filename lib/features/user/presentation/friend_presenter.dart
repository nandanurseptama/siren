import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siren/cores/utils/register_listener_fn.dart';
import 'package:siren/cores/widgets/presenter_widget.dart';
import 'package:siren/features/user/domain/entity/profile_entity.dart';
import 'package:siren/features/user/presentation/friend_cubit.dart';

class FriendPresenter extends PresenterWidget<FriendState> {
  final String userId;
  final FriendCubit friendCubit;
  final Widget Function(
    BuildContext context,
    FriendPresenterState friendPresenterState,
    FriendState friendsState,
  ) builder;
  const FriendPresenter(
      {super.key,
      required this.friendCubit,
      required this.builder,
      required this.userId});

  @override
  FriendPresenterState createState() {
    return FriendPresenterState();
  }
}

class FriendPresenterState
    extends PresenterWidgetState<FriendState, FriendPresenter> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      load();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.friendCubit,
      child: BlocConsumer<FriendCubit, FriendState>(
        bloc: widget.friendCubit,
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
  void setListener(ListenerFn<FriendState> listener) {
    if (!mounted) {
      return;
    }
    setState(() {
      this.listener = listener;
    });
    return;
  }

  void load() {
    widget.friendCubit.call(widget.userId);
    return;
  }

  void addToFriend(ProfileEntity profile) {
    widget.friendCubit.addFriend(profile);
    return;
  }
}
