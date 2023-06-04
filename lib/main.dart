import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:siren/cores/failures/failure.dart';
import 'package:siren/cores/interfaces/states/pagination_state.dart';
import 'package:siren/cores/theme.dart';
import 'package:siren/cores/widgets/not_found_screen.dart';
import 'package:siren/dependency.dart';
import 'package:siren/features/post/presentation/presenters/liked_post_presenter.dart';
import 'package:siren/features/post/presentation/presenters/posts_presenter.dart';
import 'package:siren/features/post/presentation/state_manager/posts_cubit.dart';
import 'package:siren/features/user/domain/entity/user_entity.dart';
import 'package:siren/features/user/presentation/friend_cubit.dart';
import 'package:siren/features/user/presentation/friend_presenter.dart';
import 'package:siren/features/user/presentation/friends_cubit.dart';
import 'package:siren/features/user/presentation/friends_presenter.dart';
import 'package:siren/features/user/presentation/profile_cubit.dart';
import 'package:siren/ui/screens/home_screen.dart';
import 'package:siren/ui/screens/navigation_screen.dart';
import 'package:siren/ui/screens/profile_screen.dart';

import 'cores/enums/crud_enum.dart';
import 'cores/interfaces/states/base_state.dart';
import 'features/post/domain/entity/post_entity.dart';
import 'features/user/domain/entity/profile_entity.dart';
import 'features/user/presentation/profile_presenter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initdependency();
  runApp(MyApp(
    dependency: dependency,
  ));
}

class MyApp extends StatelessWidget {
  final GetIt dependency;
  late final PostsCubit postsCubit;
  late final ProfileCubit profileMeCubit;
  late final FriendsCubit friendsCubit;
  MyApp({super.key, required this.dependency}) {
    postsCubit = dependency.get();
    profileMeCubit = dependency.get(instanceName: "profileMeCubit");
    friendsCubit = dependency.get();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Socialite',
      theme: AppTheme.fromIsDarkModeActive(true).theme,
      initialRoute: "/",
      onGenerateRoute: (settings) {
        var path = settings.name;
        if (path == null) {
          return getRoute(const NotFoundScreen());
        }
        if (path.startsWith("/profile")) {
          return getRoute(otherProfileScreen(path));
        }
        if (settings.name == NavigationScreen.routeName) {
          return getRoute(_navigationScreenBuilder());
        }

        return getRoute(const NotFoundScreen());
      },
    );
  }

  Widget _navigationScreenBuilder() {
    return NavigationScreen(
      items: const [
        (icon: Icons.home, label: "Home"),
        (icon: Icons.person, label: "Profile"),
      ],
      builders: [
        homeScreenBuilder,
        profileScreenBuilder,
      ],
    );
  }

  NavigationMenuBuilder get homeScreenBuilder {
    return (context, selectedMenuIndex, onNavigate) {
      return _profilePresenter(
        isMe: true,
        profileCubit: profileMeCubit,
        builder: (context, profilePresenterState, profileState) {
          return _postsPresenter(
            postsCubit: postsCubit,
            builder:
                (context, postsPresenterState, postsState, likedPostsState) {
              return HomeScreen(
                postsState: postsState,
                navigateToProfileScreen: (value) {
                  if (value == profileMeCubit.userId) {
                    return onNavigate(1);
                  }
                  Navigator.pushNamed(context, "/profile?id=$value");
                  return;
                },
              );
            },
          );
        },
      );
    };
  }

  NavigationMenuBuilder get profileScreenBuilder {
    var postsCubit = PostsCubit(getPostsUsecase: dependency.get());
    return (context, selectedMenuIndex, onNavigate) {
      return _profilePresenter(
        profileCubit: profileMeCubit,
        isMe: true,
        builder: (context, profilePresenterState, profileState) {
          return _postsPresenter(
            postsCubit: postsCubit,
            builder:
                (context, postsPresenterState, postsState, likedPostsState) {
              return _friendsPresenter(
                builder: (context, friendsPresenterState, friendsState) {
                  return ProfileScreen(
                    postsState: postsState,
                    registerProfileStateListener:
                        profilePresenterState.setListener,
                    onLoadUserPost: () {
                      print("loadmePost");
                      return postsPresenterState.loadPosts(
                          userId: profileMeCubit.userId);
                    },
                    friendsState: friendsState,
                    onLoadProfile: profilePresenterState.load,
                    profileState: profileState,
                    isMe: profilePresenterState.isMe,
                    onLoadFriends: friendsPresenterState.load,
                    friendState: FriendState.failure(
                        data: (event: CrudEnum.read, isFriend: false),
                        failure:
                            Failure(message: "me", trace: StackTrace.current)),
                  );
                },
              );
            },
          );
        },
      );
    };
  }

  Route getRoute(Widget child) {
    if (Platform.isIOS || Platform.isMacOS) {
      return _cupertinoRoute(child);
    }
    return _materialRoute(child);
  }

  MaterialPageRoute _materialRoute(Widget child) {
    return MaterialPageRoute(builder: (_) => child);
  }

  CupertinoPageRoute _cupertinoRoute(Widget child) {
    return CupertinoPageRoute(builder: (_) => child);
  }

  Widget _postsPresenter({
    required Widget Function(
      BuildContext context,
      PostsPresenterState postsPresenterState,
      PaginationState<PostEntity> postsState,
      BaseState<List<String>> likedPostsState,
    ) builder,
    required PostsCubit postsCubit,
  }) {
    return _likedPostPresenter(
      builder: (context, likedPostsPresenterState, likedPostsState) {
        return PostsPresenter(
          postsCubit: postsCubit,
          builder: builder,
          likedPostsState: likedPostsState,
        );
      },
    );
  }

  Widget _profilePresenter({
    required Widget Function(
      BuildContext context,
      ProfilePresenterState profilePresenterState,
      BaseState<ProfileEntity> profileState,
    ) builder,
    required ProfileCubit profileCubit,
    required bool isMe,
  }) {
    return BlocProvider.value(
      value: profileCubit,
      child: ProfilePresenter(
        profileCubit: profileCubit,
        builder: builder,
        isMe: isMe,
      ),
    );
  }

  Widget _friendsPresenter({
    required Widget Function(
      BuildContext context,
      FriendsPresenterState friendsPresenterState,
      PaginationState<UserEntity> friendsState,
    ) builder,
  }) {
    return FriendsPresenter(friendsCubit: friendsCubit, builder: builder);
  }

  Widget _friendPresenter({
    required String userId,
    required Widget Function(
      BuildContext context,
      FriendPresenterState friendPresenterState,
      FriendState friendsState,
    ) builder,
  }) {
    return FriendPresenter(
      userId: userId,
      friendCubit: dependency.get(),
      builder: builder,
    );
  }

  Widget otherProfileScreen(String path) {
    var uri = Uri.parse(path);
    var userId = uri.queryParameters['id'];
    if (userId == null) {
      return const NotFoundScreen();
    }
    if (userId.isEmpty) {
      return const NotFoundScreen();
    }
    var profileCubit = ProfileCubit(
        getUserProfileByIdUsecase: dependency.get(), userId: userId);
    var postsCubit = PostsCubit(getPostsUsecase: dependency.get());
    return _profilePresenter(
      profileCubit: profileCubit,
      isMe: false,
      builder: (context, profilePresenterState, profileState) {
        return _postsPresenter(
          postsCubit: postsCubit,
          builder: (context, postsPresenterState, postsState, likedPostsState) {
            return _friendPresenter(
                userId: userId,
                builder: (context, friendPresenterState, friendState) {
                  return Scaffold(
                    body: SafeArea(
                      child: LayoutBuilder(builder: (context, constraints) {
                        return ProfileScreen(
                          postsState: postsState,
                          registerProfileStateListener:
                              profilePresenterState.setListener,
                          onLoadUserPost: () {
                            return postsPresenterState.loadPosts(
                                userId: profileCubit.userId);
                          },
                          registerFriendStateLsitener:
                              friendPresenterState.setListener,
                          isMe: false,
                          onLoadProfile: profilePresenterState.load,
                          friendsState: PaginationState<UserEntity>.loaded(
                              total: 0, results: List.empty()),
                          profileState: profileState,
                          friendState: friendState,
                          addToFriend: friendPresenterState.addToFriend,
                          onLoadFriends: () {
                            return;
                          },
                        );
                      }),
                    ),
                  );
                });
          },
        );
      },
    );
  }

  Widget _likedPostPresenter({
    required Widget Function(
      BuildContext context,
      LikedPostPresenterState likedPostsPresenterState,
      BaseState<List<String>> likedPostsState,
    ) builder,
  }) {
    return LikedPostPresenter(
      likedPostsCubit: dependency.get(),
      builder: builder,
    );
  }
}
