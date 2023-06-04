import 'package:injectable/injectable.dart';
import 'package:siren/cores/interfaces/paginate_data.dart';
import 'package:siren/cores/usecase/usecase.dart';
import 'package:siren/features/user/domain/entity/user_entity.dart';
import 'package:siren/features/user/domain/user_repository.dart';

@lazySingleton
class GetFriendsUsecase extends Usecase<int, PaginateData<UserEntity>> {
  final UserRepository _userRepository;
  GetFriendsUsecase(
      {required super.uuidGenerator,
      required super.logger,
      required UserRepository userRepository})
      : _userRepository = userRepository;

  @override
  Future<PaginateData<UserEntity>> calling(int params) {
    return _userRepository.getUserFriends(
        processId: processId, page: params, limit: 20);
  }
}
