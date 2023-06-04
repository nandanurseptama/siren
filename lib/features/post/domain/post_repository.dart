import 'package:siren/cores/interfaces/paginate_data.dart';
import 'package:siren/features/post/data/models/post_model.dart';

abstract class PostRepository {
  Future<PaginateData<PostModel>> getAllPosts({
    required String processId,
    int page = 0,
    int limit = 20,
  });
  Future<PaginateData<PostModel>> getUserPosts({
    required String processId,
    int page = 0,
    int limit = 20,
    required String userId,
  });

  List<PostModel> getLikedPosts({
    required String processId,
  });

  Future<void> addLikedPost(
      {required String processId, required PostModel post});

  Future<void> deleteLikedPost(
      {required String processId, required String postId});
  
}
