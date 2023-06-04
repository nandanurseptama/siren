// ignore_for_file: overridden_fields

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:siren/features/user/domain/entity/user_entity.dart';

part 'user_model.g.dart';

@JsonSerializable(checked: false)
@HiveType(typeId: 1)
class UserModel extends UserEntity {
  @override
  @JsonKey(disallowNullValue: false, defaultValue: "")
  @HiveField(0)
  final String id;

  @override
  @JsonKey(disallowNullValue: false, defaultValue: "")
  @HiveField(1)
  final String firstName;

  @override
  @JsonKey(disallowNullValue: false, defaultValue: "")
  @HiveField(2)
  final String lastName;

  @override
  @JsonKey(disallowNullValue: false, defaultValue: "")
  @HiveField(3)
  final String title;

  @override
  @JsonKey(disallowNullValue: false, defaultValue: "")
  @HiveField(4)
  final String picture;

  const UserModel(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.title,
      required this.picture})
      : super(
            id: id,
            firstName: firstName,
            lastName: lastName,
            title: title,
            picture: picture);

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() {
    return _$UserModelToJson(this);
  }
  static Map<String, dynamic> toJsonStatic(UserModel instance) {
    return _$UserModelToJson(instance);
  }
}
