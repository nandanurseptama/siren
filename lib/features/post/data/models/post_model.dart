// ignore_for_file: overridden_fields

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:siren/features/post/domain/entity/post_entity.dart';
import 'package:siren/features/user/data/models/user_model.dart';

part 'post_model.g.dart';

@HiveType(typeId: 3)
@JsonSerializable()
class PostModel extends PostEntity {
  @override
  @HiveField(0)
  @JsonKey(disallowNullValue: false, defaultValue: "")
  final String id;

  @override
  @HiveField(1)
  @JsonKey(disallowNullValue: false, defaultValue: "")
  final String image;

  @override
  @HiveField(2)
  @JsonKey(disallowNullValue: false, defaultValue: 0)
  final int likes;

  @override
  @HiveField(3)
  @JsonKey(disallowNullValue: false, defaultValue: [])
  final List<String> tags;

  @override
  @HiveField(4)
  @JsonKey(disallowNullValue: false, defaultValue: "")
  final String text;

  @override
  @HiveField(5)
  @JsonKey(disallowNullValue: false, defaultValue: "")
  final String publishDate;

  @override
  @HiveField(6)
  @JsonKey(
      disallowNullValue: false,
      fromJson: UserModel.fromJson,
      toJson: UserModel.toJsonStatic)
  final UserModel owner;

  const PostModel(
      {required this.id,
      required this.image,
      required this.likes,
      required this.tags,
      required this.text,
      required this.publishDate,
      required this.owner})
      : super(
            id: id,
            image: image,
            likes: likes,
            tags: tags,
            text: text,
            publishDate: publishDate,
            owner: owner);
  @override
  List<Object?> get props => [id, image, likes, tags, text, publishDate, owner];

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);
}
