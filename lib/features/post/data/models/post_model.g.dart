// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PostModelAdapter extends TypeAdapter<PostModel> {
  @override
  final int typeId = 3;

  @override
  PostModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PostModel(
      id: fields[0] as String,
      image: fields[1] as String,
      likes: fields[2] as int,
      tags: (fields[3] as List).cast<String>(),
      text: fields[4] as String,
      publishDate: fields[5] as String,
      owner: fields[6] as UserModel,
    );
  }

  @override
  void write(BinaryWriter writer, PostModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.likes)
      ..writeByte(3)
      ..write(obj.tags)
      ..writeByte(4)
      ..write(obj.text)
      ..writeByte(5)
      ..write(obj.publishDate)
      ..writeByte(6)
      ..write(obj.owner);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PostModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostModel _$PostModelFromJson(Map<String, dynamic> json) => PostModel(
      id: json['id'] as String? ?? '',
      image: json['image'] as String? ?? '',
      likes: json['likes'] as int? ?? 0,
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              [],
      text: json['text'] as String? ?? '',
      publishDate: json['publishDate'] as String? ?? '',
      owner: UserModel.fromJson(json['owner'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PostModelToJson(PostModel instance) => <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'likes': instance.likes,
      'tags': instance.tags,
      'text': instance.text,
      'publishDate': instance.publishDate,
      'owner': UserModel.toJsonStatic(instance.owner),
    };
