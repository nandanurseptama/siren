import 'package:injectable/injectable.dart';
import 'package:siren/cores/interfaces/paginate_data.dart';
import 'package:siren/cores/usecase/usecase.dart';
import 'package:siren/features/post/domain/entity/post_entity.dart';
import 'package:siren/features/post/domain/post_repository.dart';

@lazySingleton
class GetPostsUsecase
    extends Usecase<({int page, String userId}), PaginateData<PostEntity>> {
  final PostRepository _postRepository;
  GetPostsUsecase(
      {required super.uuidGenerator,
      required super.logger,
      required PostRepository postRepository})
      : _postRepository = postRepository;

  @override
  Future<PaginateData<PostEntity>> calling(({int page, String userId}) params) {
    if (params.userId.isNotEmpty) {
      return _postRepository.getUserPosts(
          processId: processId, userId: params.userId, page: params.page);
    }
    return _postRepository.getAllPosts(processId: processId, page: params.page);
  }
}
