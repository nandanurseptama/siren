import 'package:injectable/injectable.dart';
import 'package:siren/cores/usecase/usecase.dart';
import 'package:siren/features/post/domain/entity/post_entity.dart';
import 'package:siren/features/post/domain/post_repository.dart';

@lazySingleton
class LikePostUsecase extends Usecase<PostEntity, void> {
  final PostRepository _postRepository;
  LikePostUsecase(
      {required super.uuidGenerator,
      required super.logger,
      required PostRepository postRepository})
      : _postRepository = postRepository;

  @override
  Future<void> calling(PostEntity params) async{
    return _postRepository.addLikedPost(processId: processId, post: params.model);
  }
}
