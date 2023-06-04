import 'package:flutter/widgets.dart';
import 'package:siren/cores/enums/crud_enum.dart';
import 'package:siren/cores/interfaces/states/base_state.dart';
import 'package:siren/cores/interfaces/states/pagination_state.dart';
import 'package:siren/cores/utils/register_listener_fn.dart';
import 'package:siren/cores/utils/snackbar.dart';
import 'package:siren/cores/widgets/error_container_widget.dart';
import 'package:siren/features/post/domain/entity/post_entity.dart';
import 'package:siren/features/user/domain/entity/profile_entity.dart';
import 'package:siren/features/user/domain/entity/user_entity.dart';
import 'package:siren/features/user/presentation/friend_cubit.dart';
import 'package:siren/ui/widgets/profile_screen_shimmer.dart';
import 'package:siren/ui/widgets/profile_widget.dart';

class ProfileScreen extends StatefulWidget {
  final PaginationState<UserEntity> friendsState;
  final VoidCallback onLoadProfile;
  final VoidCallback onLoadFriends;
  final ValueChanged<ProfileEntity>? addToFriend;
  final BaseState<ProfileEntity> profileState;
  final bool isMe;
  final FriendState friendState;
  final RegisterListenerFn<FriendState>? registerFriendStateLsitener;
  final VoidCallback onLoadUserPost;
  final PaginationState<PostEntity> postsState;
  final RegisterListenerFn<BaseState<ProfileEntity>>
      registerProfileStateListener;
  const ProfileScreen(
      {super.key,
      required this.onLoadProfile,
      required this.profileState,
      required this.friendsState,
      required this.onLoadFriends,
      required this.friendState,
      this.isMe = false,
      this.addToFriend,
      this.registerFriendStateLsitener,
      required this.postsState,
      required this.registerProfileStateListener,
      required this.onLoadUserPost});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget.onLoadProfile();
      widget.onLoadFriends();
      widget.registerFriendStateLsitener?.call(friendListener);
    });
  }

  void friendListener(FriendState friendState) {
    return friendState.maybeMap<void>(
      failure: (value) {
        if (value.data?.event == CrudEnum.update) {
          showSnackbarMessage(
              context: context,
              message: "Failed to add friend",
              type: SnackbarType.error);
        }
        return;
      },
      success: (value) {
        return;
      },
      orElse: () {
        return;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          constraints: constraints,
          child: builder,
        );
      },
    );
  }

  Widget get builder {
    return widget.profileState.maybeMap(
      success: (value) {
        return ProfileWidget(
          postsState: widget.postsState,
          profile: value.data,
          isMe: widget.isMe,
          friendsState: widget.friendsState,
          friendState: widget.friendState,
          onAddFriend: widget.isMe ? null : widget.addToFriend,
          onLoadPosts: widget.onLoadUserPost,
        );
      },
      failure: (value) {
        return ErrorContainerWidget(
          errorTicketId: value.failure.processId,
          message: value.failure.message,
          onReload: widget.onLoadProfile,
        );
      },
      orElse: () {
        return const ProfileScreenShimmer();
      },
    );
  }
}
