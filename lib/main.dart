// ignore_for_file: unnecessary_cast

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
import 'package:siren/features/post/presentation/presenters/comments_presenter.dart';
import 'package:siren/features/post/presentation/presenters/liked_post_presenter.dart';
import 'package:siren/features/post/presentation/presenters/posts_presenter.dart';
import 'package:siren/features/post/presentation/state_manager/comments_cubit.dart';
import 'package:siren/features/post/presentation/state_manager/posts_cubit.dart';
import 'package:siren/features/user/domain/entity/user_entity.dart';
import 'package:siren/features/user/presentation/friend_cubit.dart';
import 'package:siren/features/user/presentation/friend_presenter.dart';
import 'package:siren/features/user/presentation/friends_cubit.dart';
import 'package:siren/features/user/presentation/friends_presenter.dart';
import 'package:siren/features/user/presentation/profile_cubit.dart';
import 'package:siren/features/user/presentation/users_presenter.dart';
import 'package:siren/ui/screens/comments_screen.dart';
import 'package:siren/ui/screens/home_screen.dart';
import 'package:siren/ui/screens/liked_post_screen.dart';
import 'package:siren/ui/screens/navigation_screen.dart';
import 'package:siren/ui/screens/profile_screen.dart';
import 'package:siren/ui/screens/users_list_screen.dart';

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
  static int PROFILE_INDEX = 3;
  final GetIt dependency;
  late final PostsCubit postsCubit;
  late final ProfileCubit profileMeCubit;
  late final FriendsCubit friendsCubit;
  late final FriendCubit friendCubit;
  MyApp({super.key, required this.dependency}) {
    postsCubit = dependency.get();
    profileMeCubit = dependency.get(instanceName: "profileMeCubit");
    friendsCubit = dependency.get();
    friendCubit = FriendCubit(
        isFriendUsecase: dependency.get(),
        addFriendUsecase: dependency.get(),
        friendsCubit: friendsCubit);
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
        if (path.startsWith(UserListScreen.friendsRouteName)) {
          return getRoute(friendsScreen);
        }
        if (path == (CommentsScreen.routeName)) {
          return getRoute(commentsPresenter(settings.arguments));
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
        (icon: Icons.favorite, label: "Liked"),
        (icon: Icons.people, label: "Users"),
        (icon: Icons.person, label: "Profile"),
      ],
      builders: [
        homeScreenBuilder,
        likedPostScreenBuilder,
        usersScreen,
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
                    return onNavigate(PROFILE_INDEX);
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

  NavigationMenuBuilder get likedPostScreenBuilder {
    return (context, selectedMenuIndex, onNavigate) {
      return _likedPostPresenter(
        builder: (context, likedPostsPresenterState, likedPostsState) {
          return LikedPostScreen(
            postsState: likedPostsState,
            navigateToProfileScreen: (value) {
              if (value == profileMeCubit.userId) {
                return onNavigate(PROFILE_INDEX);
              }
              Navigator.pushNamed(context, "/profile?id=$value");
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
      BaseState<List<PostEntity>> likedPostsState,
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
      friendCubit: friendCubit,
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
                    appBar: AppBar(
                      title: const Text("Profile"),
                      automaticallyImplyLeading: true,
                    ),
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
      BaseState<List<PostEntity>> likedPostsState,
    ) builder,
  }) {
    return LikedPostPresenter(
      likedPostsCubit: dependency.get(),
      builder: builder,
    );
  }

  NavigationMenuBuilder get usersScreen {
    return (context, selectedMenuIndex, onNavigate) {
      return UsersPresenter(
          usersCubit: dependency.get(),
          builder: (context, usersPresenterState, usersState) {
            return UserListScreen(
              usersState: usersState,
              onLoadUsers: usersPresenterState.load,
              onTapUserItem: (value) {
                if (profileMeCubit.userId == value.id) {
                  return onNavigate(PROFILE_INDEX);
                }
                Navigator.pushNamed(context, "/profile?id=${value.id}");
                return;
              },
            );
          });
    };
  }

  Widget get friendsScreen {
    return _friendsPresenter(
      builder: (context, friendsPresenterState, friendsState) {
        return Scaffold(
          body: SafeArea(
            child: LayoutBuilder(builder: (context, constraints) {
              return UserListScreen(
                usersState: friendsState,
                onLoadUsers: friendsPresenterState.load,
                onTapUserItem: (value) {
                  Navigator.pushNamed(context, "/profile?id=${value.id}");
                  return;
                },
              );
            }),
          ),
        );
      },
    );
  }

  Widget commentsPresenter(Object? arguments) {
    if (arguments == null) {
      return const NotFoundScreen();
    }
    if (arguments is! PostEntity) {
      return const NotFoundScreen();
    }
    return CommentsPresenter(
      commentsCubit: CommentsCubit(
          createCommentUsecase: dependency.get(),
          getPostCommentsUsecase: dependency.get(),
          userId: profileMeCubit.userId),
      builder: (context, commentsPresenterState, commentsState) {
        return CommentsScreen(commentsState: commentsState, post: arguments);
      },
    );
  }
}
