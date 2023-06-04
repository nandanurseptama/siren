import 'package:injectable/injectable.dart';
import 'package:siren/cores/usecase/usecase.dart';
import 'package:siren/features/user/domain/entity/profile_entity.dart';
import 'package:siren/features/user/domain/user_repository.dart';

@lazySingleton
class AddFriendUsecase extends Usecase<ProfileEntity, void> {
  final UserRepository _userRepository;
  AddFriendUsecase(
      {required super.uuidGenerator,
      required super.logger,
      required UserRepository userRepository})
      : _userRepository = userRepository;

  @override
  Future<void> calling(ProfileEntity params) async {
    return _userRepository.addFriend(
        processId: processId, user: params.toModel);
  }
}
