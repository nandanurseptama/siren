import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:siren/cores/interfaces/states/base_state.dart';
import 'package:siren/cores/usecase/usecase.dart';
import 'package:siren/features/post/domain/entity/post_entity.dart';
import 'package:siren/features/post/domain/usecases/dislike_post_usecase.dart';
import 'package:siren/features/post/domain/usecases/get_liked_posts_usecase.dart';
import 'package:siren/features/post/domain/usecases/like_post_usecase.dart';

@lazySingleton
class LikedPostsCubit extends Cubit<BaseState<List<PostEntity>>> {
  final GetLikedPostsUsecase getLikedPostsUsecase;
  final LikePostUsecase likePostUsecase;
  final DislikePostUsecase dislikePostUsecase;
  LikedPostsCubit({
    required this.getLikedPostsUsecase,
    required this.dislikePostUsecase,
    required this.likePostUsecase,
  }) : super(const BaseState.initial());

  Future<void> call() {
    var prevState = state;
    emit(BaseState.loading(data: prevState.data));
    return getLikedPostsUsecase(NoUsecaseParams()).then((result) {
      return result.maybeMap<void>(
        ok: (ok) {
          emit(BaseState.success(data: ok.data));
          return;
        },
        err: (err) {
          emit(BaseState.failure(data: prevState.data, failure: err.data));
          return;
        },
        orElse: () {
          return;
        },
      );
    });
  }

  Future<void> dislike(String id) {
    var prevState = state;
    emit(BaseState.loading(data: prevState.data));
    return dislikePostUsecase(id).then((result) {
      return result.maybeMap<void>(
        ok: (ok) async {
          await call();
          return;
        },
        err: (err) {
          emit(BaseState.failure(data: prevState.data, failure: err.data));
          return;
        },
        orElse: () {
          return;
        },
      );
    });
  }

  Future<void> like(PostEntity post) {
    var prevState = state;
    emit(BaseState.loading(data: prevState.data));
    return likePostUsecase(post).then((result) {
      return result.maybeMap<void>(
        ok: (ok) async {
          await call();
          return;
        },
        err: (err) {
          emit(BaseState.failure(data: prevState.data, failure: err.data));
          return;
        },
        orElse: () {
          return;
        },
      );
    });
  }
}
