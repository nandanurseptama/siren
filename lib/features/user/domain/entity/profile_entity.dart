import 'package:siren/cores/enums/gender_enum.dart';
import 'package:siren/cores/interfaces/location/location_entity.dart';
import 'package:siren/features/user/domain/entity/user_entity.dart';

class ProfileEntity extends UserEntity {
  final GenderEnum gender;
  final String email;
  final String dateOfBirth;
  final String phone;
  final LocationEntity location;
  final String registerDate;
  final String updatedDate;


  String get locationText{
    return "${location.street}, ${location.city}, ${location.state}, ${location.country}";
  }

  const ProfileEntity({
    required super.id,
    required super.firstName,
    required super.lastName,
    required super.title,
    required super.picture,
    required this.gender,
    required this.email,
    required this.dateOfBirth,
    required this.phone,
    required this.location,
    required this.registerDate,
    required this.updatedDate,
  });
}
