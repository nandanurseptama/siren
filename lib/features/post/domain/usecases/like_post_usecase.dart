import 'package:injectable/injectable.dart';
import 'package:siren/cores/usecase/usecase.dart';
import 'package:siren/features/post/domain/post_repository.dart';

@lazySingleton
class LikePostUsecase extends Usecase<String, void> {
  final PostRepository _postRepository;
  LikePostUsecase(
      {required super.uuidGenerator,
      required super.logger,
      required PostRepository postRepository})
      : _postRepository = postRepository;

  @override
  Future<void> calling(String params) async{
    return _postRepository.addLikedPost(processId: processId, postId: params);
  }
}
