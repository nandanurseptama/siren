import 'package:flutter/material.dart';
import 'package:siren/features/user/presentation/friend_cubit.dart';

class AddFriendButton extends StatelessWidget {
  final FriendState friendState;
  final VoidCallback? onAddFriend;
  const AddFriendButton(
      {super.key, this.onAddFriend, required this.friendState});

  @override
  Widget build(BuildContext context) {
    return friendState.maybeMap(
      success: (value) {
        if (value.data.isFriend) {
          return addFriendButtonInactive;
        }
        return addFriendButtonActive;
      },
      orElse: () {
        return addFriendButtonInactive;
      },
    );
  }

  Widget get addFriendButtonActive {
    return FilledButton(
      onPressed: onAddFriend,
      child: const Text("Add Friend"),
    );
  }

  Widget get addFriendButtonInactive {
    return const SizedBox();
  }
}
