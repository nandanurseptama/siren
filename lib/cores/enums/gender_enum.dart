import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'gender_enum.g.dart';

@HiveType(typeId: 100)
@JsonEnum(valueField: 'gender')
enum GenderEnum {
  @JsonValue("female")
  @HiveField(0)
  female("female"),
  @JsonValue("male")
  @HiveField(1)
  male("male"),
  @JsonValue("other")
  @HiveField(2)
  other("other");

  const GenderEnum(this.label);
  final String label;
}
