import 'package:equatable/equatable.dart';

class LocationEntity extends Equatable {
  final String street;
  final String city;
  final String state;
  final String country;
  final String timezone;

  const LocationEntity(
      {required this.street,
      required this.city,
      required this.state,
      required this.country,
      required this.timezone});
  @override
  List<Object?> get props => [street, city, state, country, timezone];
}
