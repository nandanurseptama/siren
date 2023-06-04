import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siren/cores/interfaces/states/pagination_state.dart';
import 'package:siren/cores/utils/register_listener_fn.dart';
import 'package:siren/cores/widgets/presenter_widget.dart';
import 'package:siren/features/user/domain/entity/user_entity.dart';
import 'package:siren/features/user/presentation/friends_cubit.dart';

class FriendsPresenter extends PresenterWidget<PaginationState<UserEntity>> {
  final FriendsCubit friendsCubit;
  final Widget Function(
    BuildContext context,
    FriendsPresenterState friendsPresenterState,
    PaginationState<UserEntity> friendsState,
  ) builder;
  const FriendsPresenter(
      {super.key, required this.friendsCubit, required this.builder});

  @override
  FriendsPresenterState createState() {
    return FriendsPresenterState();
  }
}

class FriendsPresenterState extends PresenterWidgetState<
    PaginationState<UserEntity>, FriendsPresenter> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.friendsCubit,
      child: BlocConsumer<FriendsCubit, PaginationState<UserEntity>>(
        bloc: widget.friendsCubit,
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
  void setListener(ListenerFn<PaginationState<UserEntity>> listener) {
    if (!mounted) {
      return;
    }
    setState(() {
      this.listener = listener;
    });
    return;
  }

  void load() {
    widget.friendsCubit.call();
    return;
  }
}
