// ignore_for_file: overridden_fields

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:siren/cores/enums/gender_enum.dart';
import 'package:siren/cores/interfaces/location/location_model.dart';
import 'package:siren/features/user/domain/entity/profile_entity.dart';

part 'profile_model.g.dart';

@HiveType(typeId: 2)
@JsonSerializable()
class ProfileModel extends ProfileEntity {
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

  @override
  @JsonKey(disallowNullValue: false, defaultValue: GenderEnum.male)
  @HiveField(5)
  final GenderEnum gender;

  @override
  @JsonKey(disallowNullValue: false, defaultValue: "")
  @HiveField(6)
  final String email;

  @override
  @JsonKey(disallowNullValue: false, defaultValue: "")
  @HiveField(7)
  final String dateOfBirth;

  @override
  @JsonKey(disallowNullValue: false, defaultValue: "")
  @HiveField(8)
  final String phone;

  @override
  @JsonKey(
      disallowNullValue: false,
      fromJson: LocationModel.fromJson,
      toJson: LocationModel.toJsonStatic)
  @HiveField(9)
  final LocationModel location;

  @override
  @JsonKey(disallowNullValue: false, defaultValue: "")
  @HiveField(10)
  final String registerDate;

  @override
  @JsonKey(disallowNullValue: false, defaultValue: "")
  @HiveField(11)
  final String updatedDate;

  const ProfileModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.title,
    required this.picture,
    required this.gender,
    required this.email,
    required this.dateOfBirth,
    required this.phone,
    required this.location,
    required this.registerDate,
    required this.updatedDate,
  }) : super(
            id: id,
            firstName: firstName,
            lastName: lastName,
            title: title,
            picture: picture,
            gender: gender,
            email: email,
            dateOfBirth: dateOfBirth,
            phone: phone,
            location: location,
            registerDate: registerDate,
            updatedDate: updatedDate);

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);
}
