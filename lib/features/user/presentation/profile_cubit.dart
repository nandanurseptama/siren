import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siren/cores/interfaces/states/base_state.dart';
import 'package:siren/features/user/domain/entity/profile_entity.dart';
import 'package:siren/features/user/domain/usecases/get_user_profile_by_id_usecase.dart';

class ProfileCubit extends Cubit<BaseState<ProfileEntity>> {
  final GetUserProfileByIdUsecase _getUserProfileByIdUsecase;
  final String _userId;
  ProfileCubit({
    required GetUserProfileByIdUsecase getUserProfileByIdUsecase,
    required String userId,
  })  : _getUserProfileByIdUsecase = getUserProfileByIdUsecase,
        _userId = userId,
        super(const BaseState.initial());

  String get userId => _userId;
  Future<void> call() async {
    if (state.isLoading) {
      return;
    }
    emit(const BaseState.loading());
    return _getUserProfileByIdUsecase(_userId).then((result) {
      return result.maybeMap<void>(
        err: (value) {
          emit(BaseState.failure(failure: value.data));
          return;
        },
        ok: (value) {
          emit(BaseState.success(data: value.data));
          return;
        },
        orElse: () {
          return;
        },
      );
    });
  }
}
