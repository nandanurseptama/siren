import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siren/cores/interfaces/states/pagination_state.dart';
import 'package:siren/cores/utils/register_listener_fn.dart';
import 'package:siren/cores/widgets/presenter_widget.dart';
import 'package:siren/features/user/domain/entity/user_entity.dart';
import 'package:siren/features/user/presentation/users_cubit.dart';

class UsersPresenter extends PresenterWidget<PaginationState<UserEntity>> {
  final UsersCubit usersCubit;
  final Widget Function(
    BuildContext context,
    UsersPresenterState usersPresenterState,
    PaginationState<UserEntity> usersState,
  ) builder;
  const UsersPresenter(
      {super.key, required this.usersCubit, required this.builder});

  @override
  UsersPresenterState createState() {
    return UsersPresenterState();
  }
}

class UsersPresenterState
    extends PresenterWidgetState<PaginationState<UserEntity>, UsersPresenter> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.usersCubit,
      child: BlocConsumer<UsersCubit, PaginationState<UserEntity>>(
        bloc: widget.usersCubit,
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
    widget.usersCubit.call();
    return;
  }
}
