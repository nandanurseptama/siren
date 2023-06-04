// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:hive_flutter/hive_flutter.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;
import 'package:siren/cores/env.dart' as _i5;
import 'package:siren/cores/services/logger.dart' as _i6;
import 'package:siren/cores/utils/uuid_generator.dart' as _i11;
import 'package:siren/dependency.dart' as _i27;
import 'package:siren/features/post/data/post_repository_impl.dart' as _i10;
import 'package:siren/features/post/domain/post_repository.dart' as _i9;
import 'package:siren/features/post/domain/usecases/dislike_post_usecase.dart'
    as _i15;
import 'package:siren/features/post/domain/usecases/get_liked_posts_usecase.dart'
    as _i17;
import 'package:siren/features/post/domain/usecases/get_posts_usecase.dart'
    as _i18;
import 'package:siren/features/post/domain/usecases/like_post_usecase.dart'
    as _i21;
import 'package:siren/features/post/presentation/state_manager/liked_posts_cubit.dart'
    as _i22;
import 'package:siren/features/post/presentation/state_manager/posts_cubit.dart'
    as _i23;
import 'package:siren/features/user/data/models/user_model.dart' as _i4;
import 'package:siren/features/user/data/user_repository_impl.dart' as _i13;
import 'package:siren/features/user/domain/usecases/add_friend_usecase.dart'
    as _i14;
import 'package:siren/features/user/domain/usecases/get_friends_usecase.dart'
    as _i16;
import 'package:siren/features/user/domain/usecases/get_user_profile_by_id_usecase.dart'
    as _i19;
import 'package:siren/features/user/domain/usecases/is_friend_usecase.dart'
    as _i20;
import 'package:siren/features/user/domain/user_repository.dart' as _i12;
import 'package:siren/features/user/presentation/friend_cubit.dart' as _i26;
import 'package:siren/features/user/presentation/friends_cubit.dart' as _i25;
import 'package:siren/features/user/presentation/profile_cubit.dart' as _i24;
import 'package:uuid/uuid.dart' as _i7;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> $InitDependency(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final commonModule = _$CommonModule();
  await gh.factoryAsync<_i3.Box<_i4.UserModel>>(
    () => commonModule.friendsDatabase,
    instanceName: 'friendsDatabase',
    preResolve: true,
  );
  await gh.factoryAsync<_i3.Box<String>>(
    () => commonModule.likedPostDatabase,
    instanceName: 'likedPostDatabase',
    preResolve: true,
  );
  gh.factory<_i5.Env>(() => commonModule.env);
  gh.factory<_i6.Logger>(() => commonModule.logger);
  gh.factory<_i7.Uuid>(() => commonModule.uuid);
  gh.factory<_i8.Dio>(() => commonModule.getDio(gh<_i5.Env>()));
  gh.lazySingleton<_i9.PostRepository>(() => _i10.PostRepositoryImpl(
        env: gh<_i5.Env>(),
        likedPostDb: gh<_i3.Box<String>>(instanceName: 'likedPostDatabase'),
        httpClient: gh<_i8.Dio>(),
      ));
  gh.factory<_i11.UUIDGenerator>(
      () => _i11.UUIDGenerator(uuid: gh<_i7.Uuid>()));
  gh.lazySingleton<_i12.UserRepository>(() => _i13.UserRepositoryImpl(
        httpClient: gh<_i8.Dio>(),
        env: gh<_i5.Env>(),
        friendDatabase:
            gh<_i3.Box<_i4.UserModel>>(instanceName: 'friendsDatabase'),
      ));
  gh.lazySingleton<_i14.AddFriendUsecase>(() => _i14.AddFriendUsecase(
        uuidGenerator: gh<_i11.UUIDGenerator>(),
        logger: gh<_i6.Logger>(),
        userRepository: gh<_i12.UserRepository>(),
      ));
  gh.lazySingleton<_i15.DislikePostUsecase>(() => _i15.DislikePostUsecase(
        uuidGenerator: gh<_i11.UUIDGenerator>(),
        logger: gh<_i6.Logger>(),
        postRepository: gh<_i9.PostRepository>(),
      ));
  gh.lazySingleton<_i16.GetFriendsUsecase>(() => _i16.GetFriendsUsecase(
        uuidGenerator: gh<_i11.UUIDGenerator>(),
        logger: gh<_i6.Logger>(),
        userRepository: gh<_i12.UserRepository>(),
      ));
  gh.lazySingleton<_i17.GetLikedPostsUsecase>(() => _i17.GetLikedPostsUsecase(
        uuidGenerator: gh<_i11.UUIDGenerator>(),
        logger: gh<_i6.Logger>(),
        postRepository: gh<_i9.PostRepository>(),
      ));
  gh.lazySingleton<_i18.GetPostsUsecase>(() => _i18.GetPostsUsecase(
        uuidGenerator: gh<_i11.UUIDGenerator>(),
        logger: gh<_i6.Logger>(),
        postRepository: gh<_i9.PostRepository>(),
      ));
  gh.lazySingleton<_i19.GetUserProfileByIdUsecase>(
      () => _i19.GetUserProfileByIdUsecase(
            uuidGenerator: gh<_i11.UUIDGenerator>(),
            logger: gh<_i6.Logger>(),
            userRepository: gh<_i12.UserRepository>(),
          ));
  gh.lazySingleton<_i20.IsFriendUsecase>(() => _i20.IsFriendUsecase(
        uuidGenerator: gh<_i11.UUIDGenerator>(),
        logger: gh<_i6.Logger>(),
        userRepository: gh<_i12.UserRepository>(),
      ));
  gh.lazySingleton<_i21.LikePostUsecase>(() => _i21.LikePostUsecase(
        uuidGenerator: gh<_i11.UUIDGenerator>(),
        logger: gh<_i6.Logger>(),
        postRepository: gh<_i9.PostRepository>(),
      ));
  gh.lazySingleton<_i22.LikedPostsCubit>(() => _i22.LikedPostsCubit(
        getLikedPostsUsecase: gh<_i17.GetLikedPostsUsecase>(),
        dislikePostUsecase: gh<_i15.DislikePostUsecase>(),
        likePostUsecase: gh<_i21.LikePostUsecase>(),
      ));
  gh.lazySingleton<_i23.PostsCubit>(
      () => _i23.PostsCubit(getPostsUsecase: gh<_i18.GetPostsUsecase>()));
  gh.factory<_i24.ProfileCubit>(
    () => commonModule.meStateManager(
      env: gh<_i5.Env>(),
      getUserProfileByIdUsecase: gh<_i19.GetUserProfileByIdUsecase>(),
    ),
    instanceName: 'profileMeCubit',
  );
  gh.lazySingleton<_i25.FriendsCubit>(
      () => _i25.FriendsCubit(getFriendsUsecase: gh<_i16.GetFriendsUsecase>()));
  gh.lazySingleton<_i26.FriendCubit>(() => _i26.FriendCubit(
        isFriendUsecase: gh<_i20.IsFriendUsecase>(),
        addFriendUsecase: gh<_i14.AddFriendUsecase>(),
        friendsCubit: gh<_i25.FriendsCubit>(),
      ));
  return getIt;
}

class _$CommonModule extends _i27.CommonModule {}
