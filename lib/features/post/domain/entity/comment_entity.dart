import 'package:equatable/equatable.dart';
import 'package:siren/features/post/data/models/comment_model.dart';
import 'package:siren/features/user/domain/entity/user_entity.dart';

class CommentEntity extends Equatable {
  final String id;
  final String message;
  final String post;
  final String publishDate;
  final UserEntity owner;

  const CommentEntity({
    required this.id,
    required this.message,
    required this.owner,
    required this.post,
    required this.publishDate,
  });

  @override
  List<Object?> get props => [id, message, post, publishDate, owner];


  CommentModel get model{
    return CommentModel(id: id, message: message, owner: owner.toModel, post: post, publishDate: publishDate);
  }
}
