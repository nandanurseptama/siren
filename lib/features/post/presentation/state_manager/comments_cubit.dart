import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:siren/cores/interfaces/states/pagination_state.dart';
import 'package:siren/features/post/domain/entity/comment_entity.dart';
import 'package:siren/features/post/domain/usecases/create_comment_usecase.dart';
import 'package:siren/features/post/domain/usecases/get_post_comments_usecase.dart';

@lazySingleton
class CommentsCubit extends Cubit<PaginationState<CommentEntity>> {
  final CreateCommentUsecase createCommentUsecase;
  final GetPostCommentsUsecase getPostCommentsUsecase;
  final String userId;
  CommentsCubit({
    required this.createCommentUsecase,
    required this.getPostCommentsUsecase,
    required this.userId,
  }) : super(const PaginationState.initial(
            currentPage: 0, nextPage: 0, total: 0));

  Future<void> call(String postId) async {
    if (state.isLoading) {
      return;
    }
    if (state.nextPage == null) {
      return;
    }
    var prevState = state;
    int currentPage = state.nextPage!;
    var lastData = state.results ?? List<CommentEntity>.empty(growable: true);
    emit(PaginationState.loading(
      currentPage: currentPage,
      results: [...lastData],
      total: prevState.total,
    ));
    return getPostCommentsUsecase((page: currentPage, postId: postId))
        .then((result) {
      return result.maybeMap<void>(
        ok: (ok) {
          var pagination = ok.data;
          emit(PaginationState.loaded(
              results: [...lastData, ...pagination.data],
              currentPage: currentPage,
              nextPage: pagination.nextPage,
              total: ok.data.total));
          return;
        },
        err: (err) {
          emit(PaginationState.failure(
              results: [...lastData],
              currentPage: currentPage,
              nextPage: currentPage,
              failure: err.data,
              total: prevState.total));
          return;
        },
        orElse: () {
          return;
        },
      );
    });
  }
  void reset(){
    emit(const PaginationState.initial(total: 0, currentPage: 0, nextPage: 0));
    return;
  }

  Future<void> createComment({
    required String message,
    required String postId,
  }) {
    emit(PaginationState.loading(
        nextPage: state.nextPage,
        currentPage: state.currentPage,
        results: state.results,
        total: state.total));
    return createCommentUsecase(
            (message: message, postId: postId, userId: userId))
        .then((result) {
      return result.maybeMap<void>(
        ok: (value) {
          emit(
            PaginationState.loaded(
              results: [...(state.results ?? []), value.data],
              total: state.total + 1,
              currentPage: state.currentPage,
              nextPage: state.nextPage,
            ),
          );
          return;
        },
        err: (err) {
          emit(PaginationState.failure(
            failure: err.data,
            currentPage: state.currentPage,
            nextPage: state.nextPage,
            total: state.total,
            results: state.results,
          ));
          return;
        },
        orElse: () {
          return;
        },
      );
    });
  }
}
