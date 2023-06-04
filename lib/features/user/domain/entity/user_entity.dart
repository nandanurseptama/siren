import 'package:equatable/equatable.dart';
import 'package:siren/features/user/data/models/user_model.dart';

class UserEntity extends Equatable {
  final String id;
  final String firstName;
  final String lastName;
  final String title;
  final String picture;

  const UserEntity(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.title,
      required this.picture});
  String get fullName => "$firstName $lastName";
  String get fullNameWithTitle => "$title. $firstName $lastName";

  @override
  List<Object?> get props => [id, firstName, lastName, title, picture];

  UserModel get toModel {
    return UserModel(
        id: id,
        firstName: firstName,
        lastName: lastName,
        title: title,
        picture: picture);
  }
}
