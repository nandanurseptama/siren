import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:siren/cores/enums/crud_enum.dart';
import 'package:siren/cores/interfaces/states/base_state.dart';
import 'package:siren/features/user/domain/entity/profile_entity.dart';
import 'package:siren/features/user/domain/usecases/add_friend_usecase.dart';
import 'package:siren/features/user/domain/usecases/is_friend_usecase.dart';
import 'package:siren/features/user/presentation/friends_cubit.dart';

typedef FriendState = BaseState<({CrudEnum event, bool isFriend})>;

@lazySingleton
class FriendCubit extends Cubit<FriendState> {
  final AddFriendUsecase _addFriendUsecase;
  final IsFriendUsecase _isFriendUsecase;
  final FriendsCubit _friendsCubit;
  FriendCubit({
    required IsFriendUsecase isFriendUsecase,
    required AddFriendUsecase addFriendUsecase,
    required FriendsCubit friendsCubit,
  })  : _addFriendUsecase = addFriendUsecase,
        _isFriendUsecase = isFriendUsecase,
        _friendsCubit = friendsCubit,
        super(const BaseState.initial());

  Future<void> call(String userId) {
    emit(const BaseState.loading());
    return _isFriendUsecase(userId).then((result) {
      return result.maybeMap<void>(
        err: (value) {
          emit(BaseState.failure(
              failure: value.data,
              data: (event: CrudEnum.read, isFriend: false)));
          return;
        },
        ok: (value) {
          emit(BaseState.success(
              data: (event: CrudEnum.read, isFriend: value.data)));
          return;
        },
        orElse: () {
          return;
        },
      );
    });
  }

  Future<void> addFriend(ProfileEntity profile) async {
    var prevFriendsState = state.data;
    if (prevFriendsState?.isFriend == true) {
      return;
    }
    emit(BaseState.loading(
      data: prevFriendsState,
    ));
    return _addFriendUsecase(profile).then((result) {
      return result.maybeMap<void>(
        err: (value) {
          emit(BaseState.failure(
              failure: value.data,
              data: (event: CrudEnum.update, isFriend: false)));
          return;
        },
        ok: (value) {
          emit(const BaseState.success(
              data: (event: CrudEnum.update, isFriend: true)));
          _friendsCubit.call();
          return;
        },
        orElse: () {
          return;
        },
      );
    });
  }
}
