// ignore_for_file: overridden_fields

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:siren/cores/interfaces/location/location_entity.dart';

part 'location_model.g.dart';

@HiveType(typeId: 200)
@JsonSerializable(checked: false)
class LocationModel extends LocationEntity {
  @override
  @HiveField(0)
  @JsonKey(disallowNullValue: false, defaultValue: "")
  final String street;

  @override
  @HiveField(1)
  @JsonKey(disallowNullValue: false, defaultValue: "")
  final String city;

  @override
  @HiveField(2)
  @JsonKey(disallowNullValue: false, defaultValue: "")
  final String state;

  @override
  @HiveField(3)
  @JsonKey(disallowNullValue: false, defaultValue: "")
  final String country;

  @override
  @HiveField(4)
  @JsonKey(disallowNullValue: false, defaultValue: "")
  final String timezone;
  

  const LocationModel(
      {required this.street,
      required this.city,
      required this.state,
      required this.country,
      required this.timezone})
      : super(
            city: city,
            country: country,
            state: state,
            street: street,
            timezone: timezone);

  factory LocationModel.fromJson(Map<String,dynamic> json) => _$LocationModelFromJson(json);
  
  static Map<String,dynamic> toJsonStatic(LocationModel instance){
    return _$LocationModelToJson(instance);
  }
}
