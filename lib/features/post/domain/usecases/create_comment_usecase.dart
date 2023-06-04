import 'package:injectable/injectable.dart';
import 'package:siren/cores/usecase/usecase.dart';
import 'package:siren/features/post/domain/entity/comment_entity.dart';
import 'package:siren/features/post/domain/post_repository.dart';
import 'package:siren/features/user/domain/entity/user_entity.dart';

@lazySingleton
class CreateCommentUsecase extends Usecase<
    ({String userId, String postId, String message}), CommentEntity> {
  final PostRepository _postRepository;
  CreateCommentUsecase(
      {required super.uuidGenerator,
      required super.logger,
      required PostRepository postRepository})
      : _postRepository = postRepository;

  @override
  Future<CommentEntity> calling(
      ({String message, String postId, String userId}) params) {
    var userEntity = UserEntity(
        id: params.userId, firstName: "", lastName: "", title: "", picture: "");
    var commentEntity = CommentEntity(
        id: "",
        message: params.message,
        owner: userEntity,
        post: params.postId,
        publishDate: DateTime.now().toString());
    return _postRepository.addComments(
        processId: processId, comment: commentEntity.model);
  }
}
