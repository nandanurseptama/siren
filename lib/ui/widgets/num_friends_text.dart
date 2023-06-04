import 'package:flutter/material.dart';
import 'package:siren/cores/interfaces/states/pagination_state.dart';
import 'package:siren/cores/widgets/shimmer_container.dart';
import 'package:siren/features/user/domain/entity/user_entity.dart';

class NumFriendsText extends StatelessWidget {
  final PaginationState<UserEntity> friendsState;
  const NumFriendsText({super.key, required this.friendsState});

  @override
  Widget build(BuildContext context) {
    return friendsState.maybeMap(
      loaded: (value) {
        return _onLoaded(numFriends: value.total, context: context);
      },
      loading: (value) {
        return _onLoad();
      },
      orElse: () {
        return const SizedBox(
          height: 0,
          width: 0,
        );
      },
    );
  }

  Widget _onLoad() {
    return ShimmerContainer(
      size: const Size(80, 20),
      borderRadius: BorderRadius.circular(6),
    );
  }

  Widget _onLoaded({required int numFriends, required BuildContext context}) {
    if (numFriends == 0) {
      return const SizedBox(
        height: 0,
        width: 0,
      );
    }
    return InkWell(
      child: SizedBox(
        height: 20,
        child: Text(
          "$numFriends Friends",
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.primary),
        ),
      ),
    );
  }
}
