import 'package:flutter/widgets.dart';
import 'package:siren/features/user/domain/entity/user_entity.dart';
import 'package:siren/ui/widgets/user_item_widget.dart';
import 'package:siren/ui/widgets/user_item_widget_shimmer.dart';

class UserListWidget extends StatefulWidget {
  final int totalData;
  final List<UserEntity> users;
  final bool isLoading;
  final VoidCallback onScrollEndCallback;
  final ValueChanged<UserEntity>? onTapUserItem;
  const UserListWidget(
      {super.key,
      required this.users,
      this.isLoading = false,
      this.totalData = 0,
      required this.onScrollEndCallback,
      this.onTapUserItem});

  @override
  State<UserListWidget> createState() => _UserListWidgetState();
}

class _UserListWidgetState extends State<UserListWidget> {
  @override
  Widget build(BuildContext context) {
    if (widget.isLoading && widget.users.isEmpty) {
      return _listShimmer();
    }
    return listUserLoadedBuilder;
  }

  Widget _listShimmer() {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(20, (index) {
          return const UserItemWidgetShimmer();
        }),
      ),
    );
  }

  Widget get listUserLoadedBuilder {
    return NotificationListener<ScrollNotification>(
      onNotification: onNotification,
      child: listUserLoaded,
    );
  }

  bool Function(ScrollNotification) get onNotification {
    return (notification) {
      var maxScrollExtent = notification.metrics.maxScrollExtent;
      var diff = (widget.totalData - widget.users.length);
      var postsLength = widget.users.length + (diff > 5 ? 5 : diff);
      var eachPostLength = maxScrollExtent / postsLength;
      var scrollPixels = notification.metrics.pixels;
      if ((scrollPixels >= eachPostLength * widget.users.length) && diff > 0) {
        widget.onScrollEndCallback();
        return true;
      }
      return false;
    };
  }

  Widget get listUserLoaded {
    var diff = (widget.totalData - widget.users.length);
    var usersLength = widget.users.length + (diff > 5 ? 5 : diff);
    return SingleChildScrollView(
      child: Column(
        children: List.generate(usersLength, (index) {
          if (index >= widget.users.length) {
            return const UserItemWidgetShimmer();
          }
          return UserItemWidget(
            user: widget.users[index],
            onTap: onTapUser,
          );
        }),
      ),
    );
  }

  void onTapUser(UserEntity user) {
    widget.onTapUserItem?.call(user);
    return;
  }
}
