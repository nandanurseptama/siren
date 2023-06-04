// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProfileModelAdapter extends TypeAdapter<ProfileModel> {
  @override
  final int typeId = 2;

  @override
  ProfileModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProfileModel(
      id: fields[0] as String,
      firstName: fields[1] as String,
      lastName: fields[2] as String,
      title: fields[3] as String,
      picture: fields[4] as String,
      gender: fields[5] as GenderEnum,
      email: fields[6] as String,
      dateOfBirth: fields[7] as String,
      phone: fields[8] as String,
      location: fields[9] as LocationModel,
      registerDate: fields[10] as String,
      updatedDate: fields[11] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ProfileModel obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.firstName)
      ..writeByte(2)
      ..write(obj.lastName)
      ..writeByte(3)
      ..write(obj.title)
      ..writeByte(4)
      ..write(obj.picture)
      ..writeByte(5)
      ..write(obj.gender)
      ..writeByte(6)
      ..write(obj.email)
      ..writeByte(7)
      ..write(obj.dateOfBirth)
      ..writeByte(8)
      ..write(obj.phone)
      ..writeByte(9)
      ..write(obj.location)
      ..writeByte(10)
      ..write(obj.registerDate)
      ..writeByte(11)
      ..write(obj.updatedDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProfileModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) => ProfileModel(
      id: json['id'] as String? ?? '',
      firstName: json['firstName'] as String? ?? '',
      lastName: json['lastName'] as String? ?? '',
      title: json['title'] as String? ?? '',
      picture: json['picture'] as String? ?? '',
      gender: $enumDecodeNullable(_$GenderEnumEnumMap, json['gender']) ??
          GenderEnum.male,
      email: json['email'] as String? ?? '',
      dateOfBirth: json['dateOfBirth'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      location:
          LocationModel.fromJson(json['location'] as Map<String, dynamic>),
      registerDate: json['registerDate'] as String? ?? '',
      updatedDate: json['updatedDate'] as String? ?? '',
    );

Map<String, dynamic> _$ProfileModelToJson(ProfileModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'title': instance.title,
      'picture': instance.picture,
      'gender': _$GenderEnumEnumMap[instance.gender]!,
      'email': instance.email,
      'dateOfBirth': instance.dateOfBirth,
      'phone': instance.phone,
      'location': LocationModel.toJsonStatic(instance.location),
      'registerDate': instance.registerDate,
      'updatedDate': instance.updatedDate,
    };

const _$GenderEnumEnumMap = {
  GenderEnum.female: 'female',
  GenderEnum.male: 'male',
  GenderEnum.other: 'other',
};
