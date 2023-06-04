import 'package:injectable/injectable.dart';
import 'package:siren/cores/usecase/usecase.dart';
import 'package:siren/features/user/domain/entity/profile_entity.dart';
import 'package:siren/features/user/domain/user_repository.dart';

@lazySingleton
class GetUserProfileByIdUsecase extends Usecase<String, ProfileEntity> {
  final UserRepository _userRepository;
  GetUserProfileByIdUsecase(
      {required super.uuidGenerator,
      required super.logger,
      required UserRepository userRepository})
      : _userRepository = userRepository;

  @override
  Future<ProfileEntity> calling(String params) {
    return _userRepository.getUserById(processId: processId, userId: params);
  }
}
