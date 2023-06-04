import 'package:flutter/widgets.dart';
import 'package:siren/cores/interfaces/states/pagination_state.dart';
import 'package:siren/cores/widgets/error_container_widget.dart';
import 'package:siren/features/user/domain/entity/user_entity.dart';
import 'package:siren/ui/widgets/user_list_widget.dart';

class UserListScreen extends StatefulWidget {
  final PaginationState<UserEntity> usersState;
  static String routeName = "/users";
  static String friendsRouteName = "/friends";
  final VoidCallback? onLoadUsers;
  final ValueChanged<UserEntity>? onTapUserItem;
  const UserListScreen({super.key, required this.usersState, this.onLoadUsers, this.onTapUserItem});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget.onLoadUsers?.call();
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          constraints: constraints,
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.all(16),
          child: Container(
            constraints: constraints.copyWith(
                maxHeight: constraints.maxHeight - 32,
                maxWidth: constraints.maxWidth - 32,
                minHeight: 0,
                minWidth: 0),
            alignment: Alignment.topLeft,
            child: builder(),
          ),
        );
      },
    );
  }

  Widget builder() {
    return widget.usersState.maybeMap<Widget>(
      loading: (value) {
        if (value.results?.isNotEmpty == true) {
          return listUser(
              users: value.results!, isLoading: true, totalData: value.total);
        }
        return listUser(users: [], isLoading: true, totalData: 0);
      },
      loaded: (value) {
        return listUser(
            users: value.results, isLoading: false, totalData: value.total);
      },
      failure: (value) {
        return ErrorContainerWidget(
          message: value.failure.message,
          errorTicketId: value.failure.processId,
        );
      },
      orElse: () {
        return listUser(users: [], isLoading: true, totalData: 0);
      },
    );
  }

  Widget listUser({
    required List<UserEntity> users,
    required bool isLoading,
    required int totalData,
  }) {
    return UserListWidget(
      users: users,
      isLoading: isLoading,
      totalData: totalData,
      onTapUserItem: widget.onTapUserItem,
      onScrollEndCallback: () {
        widget.onLoadUsers?.call();
        return;
      },
    );
  }
}
