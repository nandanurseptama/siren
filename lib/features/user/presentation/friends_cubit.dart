import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:siren/cores/interfaces/states/pagination_state.dart';
import 'package:siren/features/user/domain/entity/user_entity.dart';
import 'package:siren/features/user/domain/usecases/get_friends_usecase.dart';

@lazySingleton
class FriendsCubit extends Cubit<PaginationState<UserEntity>> {
  final GetFriendsUsecase _getFriendsUsecase;
  FriendsCubit({
    required GetFriendsUsecase getFriendsUsecase,
  })  : _getFriendsUsecase = getFriendsUsecase,
        super(const PaginationState.initial(
            currentPage: 0, total: 0, nextPage: 0));

  Future<void> call() async {
    if (state.isLoading) {
      return;
    }
    if (state.nextPage == null) {
      return;
    }
    int currentPage = state.nextPage!;
    var lastData = state.results ?? List<UserEntity>.empty(growable: true);
    emit(PaginationState.loading(
        currentPage: currentPage, results: [...lastData], total: state.total));
    return _getFriendsUsecase(currentPage).then((result) {
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
            total: state.total,
            failure: err.data,
          ));
          return;
        },
        orElse: () {
          return;
        },
      );
    });
  }

  Future<void> callFromStart() async {
    emit(const PaginationState.initial(currentPage: 0, nextPage: 0, total: 0));
    await call();
    return;
  }
}
