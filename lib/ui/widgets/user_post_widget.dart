import 'package:flutter/material.dart';
import 'package:siren/cores/utils/utils.dart';
import 'package:siren/features/post/domain/entity/post_entity.dart';
import 'package:siren/features/post/presentation/presenters/liked_post_presenter.dart';
import 'package:siren/ui/widgets/image_widget.dart';
import 'package:siren/ui/widgets/profile_picture_widget.dart';

class UserPostWidget extends StatefulWidget {
  final ValueChanged<String> navigateToProfileScreen;
  final PostEntity post;
  final ValueChanged<String>? onTapTag;
  const UserPostWidget(
      {super.key,
      required this.post,
      required this.navigateToProfileScreen,
      this.onTapTag});

  @override
  State<UserPostWidget> createState() => _UserPostWidgetState();
}

class _UserPostWidgetState extends State<UserPostWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16, bottom: 16),
      decoration: BoxDecoration(
          border: Border(
        bottom: BorderSide(
            color: Theme.of(context).colorScheme.outline, width: 0.3),
      )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _profilePictureAndName(),
          const SizedBox(
            height: 16,
          ),
          _imageShimmer(),
          const SizedBox(
            height: 16,
          ),
          _actionButton(isLiked: isLiked),
          _likes(isLiked: isLiked),
          const SizedBox(
            height: 8,
          ),
          _textShimmer(),
          const SizedBox(
            height: 8,
          ),
          _tags(),
        ],
      ),
    );
  }

  Widget _profilePictureAndName() {
    return LayoutBuilder(builder: (context, constraints) {
      return InkWell(
        onTap: () {
          return widget.navigateToProfileScreen(widget.post.owner.id);
        },
        child: Container(
          constraints: constraints,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              CircleProfilePictureWidget(
                imageUrl: widget.post.owner.picture,
                diameter: 40,
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Text(
                  widget.post.owner.fullName.upperFirstLetterInEachWord,
                  maxLines: 1,
                ),
              )
            ],
          ),
        ),
      );
    });
  }

  Widget _imageShimmer() {
    return ImageNetworkWidget(
      imageUrl: widget.post.image,
      aspectRatio: 1,
    );
  }

  Widget _actionButton({bool isLiked = false}) {
    return Row(
      children: [
        IconButton(
            onPressed: onPressedButtonLiked,
            icon: Icon(
              isLiked ? Icons.favorite : Icons.favorite_outline,
              color: isLiked ? Colors.pink : null,
            )),
        IconButton(onPressed: () {}, icon: Icon(Icons.chat_bubble_outline))
      ],
    );
  }

  bool get isLiked {
    var ancestorState = context.findAncestorStateOfType<LikedPostPresenterState>();
    return ancestorState?.isLiked(widget.post.id) == true;
  }

  void Function()? get onPressedButtonLiked {
    var ancestorState =
        context.findAncestorStateOfType<LikedPostPresenterState>();
    if (ancestorState == null) {
      return null;
    }
    return () {
      if (isLiked) {
        return ancestorState.dislikePost(widget.post.id);
      }
      return ancestorState.likePost(widget.post);
    };
  }

  Widget _likes({bool isLiked = false}) {
    var likes = widget.post.likes;
    if (isLiked) {
      likes = likes + 1;
    }
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        width: constraints.maxWidth,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Text(
          "$likes Likes",
          maxLines: 3,
          textAlign: TextAlign.left,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(fontWeight: FontWeight.w500),
        ),
      );
    });
  }

  Widget _textShimmer() {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        width: constraints.maxWidth,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Text(
          widget.post.text,
          maxLines: 3,
          textAlign: TextAlign.left,
          overflow: TextOverflow.ellipsis,
        ),
      );
    });
  }

  Widget _tags() {
    if (widget.post.tags.isEmpty) {
      return const SizedBox();
    }
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: constraints.maxWidth,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Wrap(
            direction: Axis.horizontal,
            spacing: 16,
            runSpacing: 16,
            children: List.generate(widget.post.tags.length, (index) {
              return _tagItem(tag: widget.post.tags[index], context: context);
            }),
          ),
        );
      },
    );
  }

  Widget _tagItem({required String tag, required BuildContext context}) {
    return OutlinedButton(
        onPressed: (){
          return widget.onTapTag?.call(tag);
        },
        style: const ButtonStyle(
            padding: MaterialStatePropertyAll(EdgeInsets.all(8))),
        child: Text(
          tag.upperFirstLetterInEachWord,
          style: Theme.of(context)
              .textTheme
              .labelMedium
              ?.copyWith(color: Theme.of(context).colorScheme.primary),
        ));
  }
}
