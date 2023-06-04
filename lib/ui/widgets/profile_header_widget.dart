import 'package:flutter/material.dart';
import 'package:siren/cores/interfaces/states/pagination_state.dart';
import 'package:siren/cores/utils/extensions/extensions.dart';
import 'package:siren/features/user/domain/entity/profile_entity.dart';
import 'package:siren/features/user/domain/entity/user_entity.dart';
import 'package:siren/features/user/presentation/friend_cubit.dart';
import 'package:siren/ui/widgets/add_friend_button.dart';
import 'package:siren/ui/widgets/image_widget.dart';

import '../../cores/enums/gender_enum.dart';
import 'num_friends_text.dart';

class ProfileHeaderWidget extends StatelessWidget {
  final ProfileEntity profile;
  final PaginationState<UserEntity> friendsState;
  final FriendState friendState;
  final bool isMe;
  final ValueChanged<ProfileEntity>? onAddFriend;
  const ProfileHeaderWidget(
      {super.key,
      required this.profile,
      required this.friendsState,
      required this.friendState,
      required this.isMe,
      this.onAddFriend});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              profilePicture(),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    emailShimmer(),
                    const SizedBox(
                      height: 8,
                    ),
                    nameShimmer(),
                    const SizedBox(
                      height: 8,
                    ),
                    _numFriendsWidget(),
                  ],
                ),
              )
            ],
          ),
        ),
        genderShimmer(),
        phoneShimmer(),
        locationShimmer(),
        buttonShimmer(),
        const SizedBox(
          height: 16,
        ),
        const Divider(),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }

  Widget _numFriendsWidget() {
    return NumFriendsText(friendsState: friendsState);
  }

  Widget profilePicture() {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 80, maxWidth: 80),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: ImageNetworkWidget(
          aspectRatio: 1,
          imageUrl: profile.picture,
        ),
      ),
    );
  }

  Widget emailShimmer() {
    return Builder(builder: (context) {
      return Text(
        "@${profile.email.split("@").first}",
        style: Theme.of(context).textTheme.bodyMedium,
      );
    });
  }

  Widget nameShimmer() {
    return Builder(builder: (context) {
      return Text(
        profile.fullNameWithTitle.upperFirstLetterInEachWord,
        style: Theme.of(context).textTheme.bodyLarge,
      );
    });
  }

  Widget genderShimmer() {
    bool isMale = profile.gender == GenderEnum.male;
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
      child: Row(
        children: [
          Icon(
            isMale ? Icons.male : Icons.female,
            color: isMale ? Colors.blue : Colors.pink,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(profile.gender.label.upperFirstLetterInEachWord)
        ],
      ),
    );
  }

  Widget phoneShimmer() {
    return Builder(builder: (context) {
      return Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 4),
          child: InkWell(
              child: SizedBox(
                  height: 20,
                  child: Text(
                    profile.phone,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.primary),
                  ))));
    });
  }

  Widget locationShimmer() {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
            child: Text(
              profile.locationText,
              maxLines: 3,
            ),
          ),
        ),
      ],
    );
  }

  Widget buttonShimmer() {
    return isMe ? editProfileButton : addFriendButton;
  }

  Widget get addFriendButton {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: AddFriendButton(
              friendState: friendState,
              onAddFriend: isMe
                  ? null
                  : () {
                      return onAddFriend?.call(profile);
                    },
            ),
          ),
        )
      ],
    );
  }

  Widget get editProfileButton {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: OutlinedButton(
              onPressed: () {},
              child: const Text("Edit Profile"),
            ),
          ),
        )
      ],
    );
  }
}
