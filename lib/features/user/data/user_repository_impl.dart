import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:siren/cores/env.dart';
import 'package:siren/cores/failures/network_failure/invalid_response_type_failure.dart';
import 'package:siren/cores/failures/network_failure/not_found_failure.dart';
import 'package:siren/cores/interfaces/paginate_data.dart';
import 'package:siren/cores/usecase/repository_error_handler.dart';
import 'package:siren/features/user/data/models/profile_model.dart';
import 'package:siren/features/user/data/models/user_model.dart';
import 'package:siren/features/user/domain/user_repository.dart';

@LazySingleton(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  final Dio _httpClient;
  final Env _env;
  final Box<UserModel> _friendsDatabase;

  const UserRepositoryImpl(
      {required Dio httpClient,
      required Env env,
      @Named("friendsDatabase") required Box<UserModel> friendDatabase})
      : _env = env,
        _httpClient = httpClient,
        _friendsDatabase = friendDatabase;
  @override
  Future<PaginateData<UserModel>> getAllUsers(
      {required String processId, int page = 0, int limit = 20}) async {
    try {
      var response = await _httpClient
          .get(_env.userUrl, queryParameters: {"page": page, "limit": limit});

      if (response.data == null) {
        return PaginateData(
            data: List.empty(growable: true),
            page: page,
            limit: limit,
            total: 0);
      }
      if (response.data is! Map<String, dynamic>) {
        throw InvalidResponseTypeFailure();
      }
      return PaginateData.fromJson(
        json: response.data,
        builder: (json) {
          return UserModel.fromJson(json);
        },
      );
    } catch (err, trace) {
      var failure =
          repositoryErrorHandler(err: err, processId: processId, trace: trace);
      throw failure;
    }
  }

  @override
  Future<ProfileModel> getUserById(
      {required String processId, required String userId}) async {
    try {
      var response = await _httpClient.get("${_env.userUrl}/$userId");

      if (response.data == null) {
        throw NotFoundFailure(
          trace: StackTrace.current,
        );
      }
      if (response.data is! Map<String, dynamic>) {
        throw InvalidResponseTypeFailure();
      }
      return ProfileModel.fromJson(response.data);
    } catch (err, trace) {
      var failure =
          repositoryErrorHandler(err: err, processId: processId, trace: trace);
      throw failure;
    }
  }

  @override
  Future<PaginateData<UserModel>> getUserFriends(
      {required String processId, int page = 0, int limit = 20}) async {
    try {
      var users = _friendsDatabase.values.map((e) => e).toList();
      if (users.isEmpty) {
        return PaginateData<UserModel>(
            data: List<UserModel>.empty(growable: true),
            page: page,
            limit: limit,
            total: 0);
      }
      var start = (page * limit);
      var to = ((page + 1) * limit);
      var end = to > users.length ? users.length : to;
      var subUsers = users.sublist(start, end);
      return PaginateData<UserModel>(
          data: subUsers, limit: limit, page: page, total: users.length);
    } catch (err, trace) {
      var failure =
          repositoryErrorHandler(err: err, processId: processId, trace: trace);
      throw failure;
    }
  }

  @override
  bool isUserAddedToFriend(
      {required String processId, required String userId}) {
    try {
      var r = _friendsDatabase.get(userId);
      return r != null;
    } catch (err, trace) {
      var failure =
          repositoryErrorHandler(err: err, processId: processId, trace: trace);
      throw failure;
    }
  }

  @override
  void addFriend({required String processId, required UserModel user}) async {
    try {
      await _friendsDatabase.put(user.id, user);
      return;
    } catch (err, trace) {
      var failure =
          repositoryErrorHandler(err: err, processId: processId, trace: trace);
      throw failure;
    }
  }
}
