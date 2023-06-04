// ignore_for_file: overridden_fields

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:siren/features/post/domain/entity/comment_entity.dart';
import 'package:siren/features/user/data/models/user_model.dart';

part 'comment_model.g.dart';

@JsonSerializable(checked: false)
class CommentModel extends CommentEntity {
  @override
  @JsonKey(defaultValue: "", disallowNullValue: false)
  final String id;

  @override
  @JsonKey(defaultValue: "", disallowNullValue: false)
  final String message;

  @override
  @JsonKey(defaultValue: "", disallowNullValue: false)
  final String post;

  @override
  @JsonKey(defaultValue: "", disallowNullValue: false)
  final String publishDate;

  @override
  @JsonKey(fromJson: UserModel.fromJson, toJson: UserModel.toJsonStatic)
  final UserModel owner;

  const CommentModel({
    required this.id,
    required this.message,
    required this.owner,
    required this.post,
    required this.publishDate,
  }) : super(
            id: id,
            message: message,
            owner: owner,
            post: post,
            publishDate: publishDate);

  factory CommentModel.fromJson(Map<String, dynamic> json) =>
      _$CommentModelFromJson(json);

  Map<String, dynamic> createComment() {
    return {
      "message": message,
      "owner": owner.id,
      "post": post,
    };
  }
}
