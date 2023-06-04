import 'package:injectable/injectable.dart';
import 'package:siren/cores/interfaces/paginate_data.dart';
import 'package:siren/cores/usecase/usecase.dart';
import 'package:siren/features/post/domain/entity/comment_entity.dart';
import 'package:siren/features/post/domain/post_repository.dart';

@lazySingleton
class GetPostCommentsUsecase
    extends Usecase<({int page, String postId}), PaginateData<CommentEntity>> {
  final PostRepository _postRepository;
  GetPostCommentsUsecase(
      {required super.uuidGenerator,
      required super.logger,
      required PostRepository postRepository})
      : _postRepository = postRepository;

  @override
  Future<PaginateData<CommentEntity>> calling(
      ({int page, String postId}) params) {
    return _postRepository.getComments(
        processId: processId,
        page: params.page,
        postId: params.postId,
        limit: 20);
  }
}
