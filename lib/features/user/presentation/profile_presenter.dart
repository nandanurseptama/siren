import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siren/cores/interfaces/states/base_state.dart';
import 'package:siren/cores/utils/register_listener_fn.dart';
import 'package:siren/cores/widgets/presenter_widget.dart';
import 'package:siren/features/user/domain/entity/profile_entity.dart';
import 'package:siren/features/user/presentation/profile_cubit.dart';

class ProfilePresenter extends PresenterWidget<BaseState<ProfileEntity>> {
  final ProfileCubit profileCubit;
  final bool isMe;
  final Widget Function(
    BuildContext context,
    ProfilePresenterState profilePresenterState,
    BaseState<ProfileEntity> profileState,
  ) builder;
  const ProfilePresenter(
      {super.key,
      required this.profileCubit,
      required this.builder,
      this.isMe = false});

  @override
  ProfilePresenterState createState() {
    return ProfilePresenterState();
  }
}

class ProfilePresenterState
    extends PresenterWidgetState<BaseState<ProfileEntity>, ProfilePresenter> {
  bool get isMe => widget.isMe;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, BaseState<ProfileEntity>>(
      bloc: widget.profileCubit,
      listener: (context, state) {
        return listener?.call(state);
      },
      builder: (context, state) {
        return widget.builder(context, this, state);
      },
    );
  }

  @override
  void setListener(ListenerFn<BaseState<ProfileEntity>> listener) {
    if (!mounted) {
      return;
    }
    setState(() {
      this.listener = listener;
    });
    return;
  }

  void load() {
    widget.profileCubit.call();
    return;
  }
}
