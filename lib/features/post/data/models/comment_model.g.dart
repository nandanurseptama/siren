// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentModel _$CommentModelFromJson(Map<String, dynamic> json) => CommentModel(
      id: json['id'] as String? ?? '',
      message: json['message'] as String? ?? '',
      owner: UserModel.fromJson(json['owner'] as Map<String, dynamic>),
      post: json['post'] as String? ?? '',
      publishDate: json['publishDate'] as String? ?? '',
    );

Map<String, dynamic> _$CommentModelToJson(CommentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'message': instance.message,
      'post': instance.post,
      'publishDate': instance.publishDate,
      'owner': UserModel.toJsonStatic(instance.owner),
    };
