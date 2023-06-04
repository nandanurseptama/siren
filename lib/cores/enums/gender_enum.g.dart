// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gender_enum.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GenderEnumAdapter extends TypeAdapter<GenderEnum> {
  @override
  final int typeId = 100;

  @override
  GenderEnum read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return GenderEnum.female;
      case 1:
        return GenderEnum.male;
      case 2:
        return GenderEnum.other;
      default:
        return GenderEnum.female;
    }
  }

  @override
  void write(BinaryWriter writer, GenderEnum obj) {
    switch (obj) {
      case GenderEnum.female:
        writer.writeByte(0);
        break;
      case GenderEnum.male:
        writer.writeByte(1);
        break;
      case GenderEnum.other:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GenderEnumAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
