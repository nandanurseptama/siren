import 'package:siren/cores/interfaces/paginate_data.dart';
import 'package:siren/features/user/data/models/profile_model.dart';
import 'package:siren/features/user/data/models/user_model.dart';

abstract class UserRepository {
  Future<PaginateData<UserModel>> getUserFriends({
    required String processId,
    int page = 0,
    int limit = 20,
  });

  Future<PaginateData<UserModel>> getAllUsers({
    required String processId,
    int page = 0,
    int limit = 20,
  });

  Future<ProfileModel> getUserById({
    required String processId,
    required String userId,
  });

  bool isUserAddedToFriend({
    required String processId,
    required String userId,
  });
  void addFriend({
    required String processId,
    required UserModel user,
  });
}
