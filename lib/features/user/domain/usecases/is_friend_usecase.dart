import 'package:injectable/injectable.dart';
import 'package:siren/cores/usecase/usecase.dart';
import 'package:siren/features/user/domain/user_repository.dart';

@lazySingleton
class IsFriendUsecase extends Usecase<String, bool> {
  final UserRepository _userRepository;
  IsFriendUsecase(
      {required super.uuidGenerator,
      required super.logger,
      required UserRepository userRepository})
      : _userRepository = userRepository;

  @override
  Future<bool> calling(String params) async {
    return _userRepository.isUserAddedToFriend(
        processId: processId, userId: params);
  }
}
