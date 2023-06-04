import 'package:flutter/material.dart';
import 'package:siren/cores/interfaces/states/pagination_state.dart';
import 'package:siren/cores/widgets/shimmer_container.dart';
import 'package:siren/features/post/domain/entity/post_entity.dart';
import 'package:siren/features/user/domain/entity/profile_entity.dart';
import 'package:siren/features/user/domain/entity/user_entity.dart';
import 'package:siren/features/user/presentation/friend_cubit.dart';
import 'package:siren/ui/widgets/post_list_widget.dart';
import 'package:siren/ui/widgets/profile_header_widget.dart';

class ProfileWidget extends StatefulWidget {
  final ProfileEntity profile;
  final PaginationState<UserEntity> friendsState;
  final VoidCallback onLoadPosts;
  final ValueChanged<ProfileEntity>? onAddFriend;
  final PaginationState<PostEntity> postsState;
  final FriendState friendState;
  final bool isMe;
  const ProfileWidget({
    super.key,
    required this.profile,
    required this.isMe,
    required this.friendsState,
    required this.friendState,
    required this.postsState,
    required this.onLoadPosts,
    this.onAddFriend,
  });

  @override
  State<StatefulWidget> createState() {
    return _ProfileWidgetState();
  }
}

class _ProfileWidgetState extends State<ProfileWidget> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          return false;
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              headerShimmer(),
              _userPostsBuilder(),
            ],
          ),
        ),
      );
    });
  }

  Widget Function(BuildContext context, BoxConstraints constraints)
      get searchFieldShimmer {
    return (context, constraints) {
      return Padding(
        padding:
            const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
        child: ShimmerContainer(
          size: Size(constraints.maxWidth - 32, 50),
          borderRadius: BorderRadius.circular(8),
        ),
      );
    };
  }

  Widget headerShimmer() {
    return ProfileHeaderWidget(
      profile: widget.profile,
      friendsState: widget.friendsState,
      friendState: widget.friendState,
      isMe: widget.isMe,
      onAddFriend: widget.onAddFriend,
    );
  }

  Widget _userPostsBuilder() {
    return PostListWidget(
      postsState: widget.postsState,
      navigateToProfileScreen: (v) {},
      onLoad: widget.onLoadPosts,
    );
  }
}
