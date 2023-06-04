import 'package:flutter/material.dart';
import 'package:siren/cores/utils/utils.dart';
import 'package:siren/features/user/domain/entity/user_entity.dart';
import 'package:siren/ui/widgets/image_widget.dart';

class UserItemWidget extends StatelessWidget {
  final UserEntity user;
  final ValueChanged<UserEntity>? onTap;
  const UserItemWidget({super.key, required this.user, this.onTap});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return InkWell(
        onTap: () {
          return onTap?.call(user);
        },
        child: Container(
          width: constraints.maxWidth,
          height: 70,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(width: 0.9))),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _profilePicture(),
              const SizedBox(
                width: 16,
              ),
              Expanded(child: name(context))
            ],
          ),
        ),
      );
    });
  }

  Widget name(BuildContext context) {
    return Text(
      user.fullNameWithTitle.upperFirstLetterInEachWord,
      style: Theme.of(context).textTheme.bodyMedium,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _profilePicture() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: SizedBox(
        height: 40,
        width: 40,
        child: ImageNetworkWidget(aspectRatio: 1, imageUrl: user.picture),
      ),
    );
  }
}
