import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:siren/cores/env.dart';
import 'package:siren/cores/failures/network_failure/invalid_response_type_failure.dart';
import 'package:siren/cores/failures/network_failure/response_null_failure.dart';
import 'package:siren/cores/interfaces/paginate_data.dart';
import 'package:siren/cores/usecase/repository_error_handler.dart';
import 'package:siren/features/post/data/models/comment_model.dart';
import 'package:siren/features/post/data/models/post_model.dart';
import 'package:siren/features/post/domain/post_repository.dart';

@LazySingleton(as: PostRepository)
class PostRepositoryImpl implements PostRepository {
  final Env _env;
  final Dio _httpClient;
  final Box<PostModel> _likedPostDb;

  PostRepositoryImpl({
    required Env env,
    @Named("likedPostDatabase") required Box<PostModel> likedPostDb,
    required Dio httpClient,
  })  : _env = env,
        _likedPostDb = likedPostDb,
        _httpClient = httpClient;
  @override
  Future<PaginateData<PostModel>> getAllPosts(
      {required String processId, int page = 0, int limit = 20}) async {
    try {
      var response = await _httpClient.get(
        _env.postUrl,
        queryParameters: {"page": page, "limit": limit},
      );
      if (response.data == null) {
        throw ResponseNullFailure();
      }
      if (response.data is! Map<String, dynamic>) {
        throw InvalidResponseTypeFailure();
      }
      var pagination = PaginateData.fromJson(
          json: response.data,
          builder: (p0) {
            return PostModel.fromJson(p0);
          });
      debugPrint("pagination $pagination");
      return pagination;
    } catch (err, trace) {
      var f =
          repositoryErrorHandler(err: err, processId: processId, trace: trace);
      throw f;
    }
  }

  @override
  List<PostModel> getLikedPosts({required String processId}) {
    try {
      var result = _likedPostDb.values.map((e) => e).toList();
      return result;
    } catch (err, trace) {
      var f =
          repositoryErrorHandler(err: err, processId: processId, trace: trace);
      throw f;
    }
  }

  @override
  Future<void> addLikedPost(
      {required String processId, required PostModel post}) async {
    try {
      await _likedPostDb.put(post.id, post);
      return;
    } catch (err, trace) {
      var f =
          repositoryErrorHandler(err: err, processId: processId, trace: trace);
      throw f;
    }
  }

  @override
  Future<void> deleteLikedPost(
      {required String processId, required String postId}) async {
    try {
      await _likedPostDb.delete(postId);
      return;
    } catch (err, trace) {
      var f =
          repositoryErrorHandler(err: err, processId: processId, trace: trace);
      throw f;
    }
  }

  @override
  Future<PaginateData<PostModel>> getUserPosts(
      {required String processId,
      int page = 0,
      int limit = 20,
      required String userId}) async {
    try {
      var response = await _httpClient.get(
        "${_env.userUrl}/$userId/post",
        queryParameters: {"page": page, "limit": limit},
      );
      if (response.data == null) {
        throw ResponseNullFailure();
      }
      if (response.data is! Map<String, dynamic>) {
        throw InvalidResponseTypeFailure();
      }
      var pagination = PaginateData.fromJson(
          json: response.data,
          builder: (p0) {
            return PostModel.fromJson(p0);
          });
      debugPrint("pagination $pagination");
      return pagination;
    } catch (err, trace) {
      var f =
          repositoryErrorHandler(err: err, processId: processId, trace: trace);
      throw f;
    }
  }

  @override
  Future<CommentModel> addComments(
      {required String processId, required CommentModel comment}) async {
    try {
      var response = await _httpClient.post(
        "${_env.commentUrl}/create",
        data: comment.createComment(),
      );
      if (response.data == null) {
        throw ResponseNullFailure();
      }
      if (response.data is! Map<String, dynamic>) {
        throw InvalidResponseTypeFailure();
      }
      return CommentModel.fromJson(response.data);
    } catch (err, trace) {
      var f =
          repositoryErrorHandler(err: err, processId: processId, trace: trace);
      throw f;
    }
  }

  @override
  Future<PaginateData<CommentModel>> getComments(
      {required String processId,
      required String postId,
      int page = 0,
      int limit = 20}) async {
    try {
      var response = await _httpClient.get(
        "${_env.postUrl}/$postId/comment",
        queryParameters: {"page": page, "limit": limit},
      );
      if (response.data == null) {
        throw ResponseNullFailure();
      }
      if (response.data is! Map<String, dynamic>) {
        throw InvalidResponseTypeFailure();
      }
      var pagination = PaginateData.fromJson(
          json: response.data,
          builder: (p0) {
            return CommentModel.fromJson(p0);
          });
      debugPrint("pagination $pagination");
      return pagination;
    } catch (err, trace) {
      var f =
          repositoryErrorHandler(err: err, processId: processId, trace: trace);
      throw f;
    }
  }
}
