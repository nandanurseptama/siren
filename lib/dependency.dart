import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart' as pp;
import 'package:siren/cores/enums/gender_enum.dart';
import 'package:siren/cores/env.dart';
import 'package:siren/cores/interfaces/location/location_model.dart';
import 'package:siren/cores/services/dio_interceptors/api_key_interceptor.dart';
import 'package:siren/cores/services/logger.dart';
import 'package:siren/features/post/data/models/post_model.dart';
import 'package:siren/features/user/data/models/profile_model.dart';
import 'package:siren/features/user/data/models/user_model.dart';
import 'package:siren/features/user/presentation/profile_cubit.dart';
import 'package:siren/features/user/domain/usecases/get_user_profile_by_id_usecase.dart';
import 'package:uuid/uuid.dart';
import 'dependency.config.dart';

GetIt dependency = GetIt.instance;

@InjectableInit(
  initializerName: "\$InitDependency",
  asExtension: false,
  preferRelativeImports: false,
)
Future<void> initdependency() async {
  var documentDirectory = await pp.getApplicationDocumentsDirectory();
  await Hive.initFlutter(documentDirectory.path);
  registerLocalDatabase();
  await $InitDependency(dependency);
  return;
}

void registerLocalDatabase() {
  Hive.registerAdapter(GenderEnumAdapter());
  Hive.registerAdapter(LocationModelAdapter());
  Hive.registerAdapter(UserModelAdapter());
  Hive.registerAdapter(ProfileModelAdapter());
  Hive.registerAdapter(PostModelAdapter());
}

@module
abstract class CommonModule {
  Env get env => Env.create();

  Dio getDio(Env env) {
    var d = Dio();
    var apiKeyInterceptor = ApiKeyInterceptor(env: env);
    d.interceptors.add(apiKeyInterceptor);
    d.interceptors.add(LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,
    ));
    return d;
  }

  Logger get logger => CmdLogger();
  Uuid get uuid => const Uuid();

  @Named("friendsDatabase")
  @preResolve
  Future<Box<UserModel>> get friendsDatabase =>
      Hive.openBox<UserModel>("friends");

  @Named("likedPostDatabase")
  @preResolve
  Future<Box<String>> get likedPostDatabase => Hive.openBox("likedPosts");

  @Named("profileMeCubit")
  ProfileCubit meStateManager({
    required Env env,
    required GetUserProfileByIdUsecase getUserProfileByIdUsecase,
  }) {
    return ProfileCubit(
        getUserProfileByIdUsecase: getUserProfileByIdUsecase, userId: env.meId);
  }
}
