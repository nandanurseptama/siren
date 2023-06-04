import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:siren/cores/interfaces/states/pagination_state.dart';
import 'package:siren/features/user/domain/entity/user_entity.dart';
import 'package:siren/features/user/domain/usecases/get_users_usecase.dart';

@lazySingleton
class UsersCubit extends Cubit<PaginationState<UserEntity>> {
  final GetUsersUsecase _getUsersUsecase;
  UsersCubit({
    required GetUsersUsecase getUsersUsecase,
  })  : _getUsersUsecase = getUsersUsecase,
        super(const PaginationState.initial(
            currentPage: 0, nextPage: 0, total: 0));

  Future<void> call({String userId = ""}) async {
    if (state.isLoading) {
      return;
    }
    if (state.nextPage == null) {
      return;
    }
    var prevState = state;
    int currentPage = state.nextPage!;
    var lastData = state.results ?? List<UserEntity>.empty(growable: true);
    emit(PaginationState.loading(
      currentPage: currentPage,
      results: [...lastData],
      total: prevState.total,
    ));
    return _getUsersUsecase(currentPage).then((result) {
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
}
