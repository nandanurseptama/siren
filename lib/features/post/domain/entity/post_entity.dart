import 'package:equatable/equatable.dart';
import 'package:siren/features/user/domain/entity/user_entity.dart';

class PostEntity extends Equatable {
  final String id;
  final String image;
  final int likes;
  final List<String> tags;
  final String text;
  final String publishDate;
  final UserEntity owner;

  const PostEntity(
      {required this.id,
      required this.image,
      required this.likes,
      required this.tags,
      required this.text,
      required this.publishDate,
      required this.owner});
  @override
  List<Object?> get props => [id, image, likes, tags, text, publishDate, owner];
}