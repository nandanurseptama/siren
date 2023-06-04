import 'package:flutter/material.dart';
import 'package:siren/cores/utils/extensions/extensions.dart';
import 'package:siren/features/post/domain/entity/comment_entity.dart';
import 'package:siren/ui/widgets/image_widget.dart';

class CommentItemWidget extends StatelessWidget {
  final CommentEntity comment;
  const CommentItemWidget({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _profilePicture(),
            const SizedBox(
              width: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _textComment(constraints.copyWith(
                    maxWidth: constraints.maxWidth - 56, minWidth: 0)),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  DateTime.parse(comment.publishDate).commentTime,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.outline),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }

  Widget _textComment(BoxConstraints constraints) {
    return Builder(
      builder: (context) {
        var style = Theme.of(context).textTheme.bodySmall;
        return SizedBox(
          width: constraints.maxWidth - 32,
          child: Text.rich(
            TextSpan(
                text:
                    comment.owner.fullNameWithTitle.upperFirstLetterInEachWord,
                children: [
                  TextSpan(
                      text: "\t${comment.message}",
                      style: style?.copyWith(fontWeight: FontWeight.w400)),
                ],
                style: style?.copyWith(fontWeight: FontWeight.w600)),
            maxLines: 1000,
          ),
        );
      },
    );
  }

  Widget _profilePicture() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: SizedBox(
        height: 40,
        width: 40,
        child: ImageNetworkWidget(
          aspectRatio: 1,
          imageUrl: comment.owner.picture,
        ),
      ),
    );
  }
}
