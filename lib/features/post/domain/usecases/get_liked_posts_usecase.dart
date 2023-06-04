import 'package:injectable/injectable.dart';
import 'package:siren/cores/usecase/usecase.dart';
import 'package:siren/features/post/domain/entity/post_entity.dart';
import 'package:siren/features/post/domain/post_repository.dart';

@lazySingleton
class GetLikedPostsUsecase extends Usecase<NoUsecaseParams, List<PostEntity>> {
  final PostRepository _postRepository;
  GetLikedPostsUsecase(
      {required super.uuidGenerator,
      required super.logger,
      required PostRepository postRepository})
      : _postRepository = postRepository;

  @override
  Future<List<PostEntity>> calling(NoUsecaseParams params) async {
    return _postRepository.getLikedPosts(processId: processId);
  }
}
