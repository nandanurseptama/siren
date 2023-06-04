import 'package:flutter/material.dart';
import 'package:siren/cores/assets.dart';
import 'package:siren/cores/interfaces/states/pagination_state.dart';
import 'package:siren/cores/utils/extensions/string_extensions.dart';
import 'package:siren/cores/widgets/error_container_widget.dart';
import 'package:siren/features/post/domain/entity/post_entity.dart';
import 'package:siren/ui/widgets/search_field_widget.dart';
import 'package:siren/ui/widgets/user_post_widget.dart';
import 'package:siren/ui/widgets/user_post_widget_shimmer.dart';

class PostListWidget extends StatefulWidget {
  final PaginationState<PostEntity> postsState;
  final ValueChanged<String>? navigateToProfileScreen;
  final VoidCallback onLoad;
  const PostListWidget(
      {super.key,
      required this.postsState,
      this.navigateToProfileScreen,
      required this.onLoad});

  @override
  State<PostListWidget> createState() => _PostListWidgetState();
}

class _PostListWidgetState extends State<PostListWidget> {
  final FocusNode _searchFieldFocusNode = FocusNode();
  final ValueNotifier<String> _filterTextController = ValueNotifier("");
  final ValueNotifier<List<String>> _selectedTagsController =
      ValueNotifier(List<String>.empty(growable: true));
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget.onLoad();
    });
  }

  void onTypingSearchField(String value) {
    setState(() {
      _filterTextController.value = value;
    });
    return;
  }

  bool Function(PostEntity post) postFilters(
      {required List<String> tags, required String searchValue}) {
    return (post) {
      var tagFound = tags.isEmpty
          ? true
          : post.tags.isEmpty
              ? true
              : post.tags.indexWhere((element) =>
                      tags.indexWhere((filterTag) =>
                          filterTag.toLowerCase() == element.toLowerCase()) >
                      -1) >
                  -1;
      var textFound = searchValue.isEmpty
          ? true
          : post.text.isEmpty
              ? true
              : post.text.toLowerCase().contains(searchValue.toLowerCase());
      var nameFound = searchValue.isEmpty
          ? true
          : post.owner.fullName.isEmpty
              ? true
              : post.owner.fullName
                  .toLowerCase()
                  .contains(searchValue.toLowerCase());
      return (nameFound || textFound) && tagFound;
    };
  }

  @override
  Widget build(BuildContext context) {
    return builder();
  }

  Widget builder() {
    return ValueListenableBuilder(
      valueListenable: _filterTextController,
      builder: (context, textFilter, child) {
        return ValueListenableBuilder(
          valueListenable: _selectedTagsController,
          builder: (context, tags, child) {
            return widget.postsState.maybeMap<Widget>(
              loaded: (value) {
                return loaded(
                    totalData: value.total,
                    posts: value.results,
                    tags: tags,
                    textFilter: textFilter);
              },
              failure: (value) {
                return const ErrorContainerWidget();
              },
              loading: (value) {
                if (value.results?.isNotEmpty == true) {
                  return loaded(
                      totalData: value.total,
                      posts: value.results!,
                      tags: tags,
                      textFilter: textFilter);
                }
                return loading;
              },
              orElse: () {
                return loading;
              },
            );
          },
        );
      },
    );
  }

  List<Widget> get shimmers {
    return List.generate(20, (index) {
      return postShimmer;
    });
  }

  Widget searchError() {
    return const ErrorContainerWidget(
      assetPath: AssetImagePath.notFoundErrorAsset,
      message: "Try reprashing your search word",
    );
  }

  Widget get loading {
    return SingleChildScrollView(
      child: Column(
        children: shimmers,
      ),
    );
  }

  Widget loaded({
    required int totalData,
    required List<PostEntity> posts,
    required List<String> tags,
    required String textFilter,
  }) {
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (isFilterActive) {
          return false;
        }
        if (totalData == 0) {
          return false;
        }
        if (posts.isEmpty) {
          return false;
        }
        var maxScrollExtent = notification.metrics.maxScrollExtent;
        var diff = (totalData - posts.length);
        var postsLength = posts.length + (diff > 5 ? 5 : diff);
        var eachPostLength = maxScrollExtent / postsLength;
        var scrollPixels = notification.metrics.pixels;
        if (scrollPixels >= eachPostLength * posts.length) {
          widget.onLoad();
          return true;
        }
        return true;
      },
      child: Builder(builder: (context) {
        var postWidges = _postsItems(
            posts: posts, tags: tags, textFilter: textFilter, total: totalData);
        return SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                searchFieldWidget,
                if (postWidges.isEmpty) searchError(),
                if (postWidges.isNotEmpty) ...postWidges
              ]),
        );
      }),
    );
  }

  List<Widget> _postsItems(
      {required List<PostEntity> posts,
      required List<String> tags,
      required String textFilter,
      required int total}) {
    if (posts.isEmpty) {
      return List.empty(growable: true);
    }
    var filteredPost = posts
        .where((element) =>
            postFilters(tags: tags, searchValue: textFilter)(element))
        .toList();

    var diff = (total - posts.length);
    var additional = isFilterActive ? 0 : (diff > 5 ? 5 : diff);
    return List.generate(filteredPost.length + additional, (index) {
      if (index >= filteredPost.length) {
        return postShimmer;
      }
      return _postItem(filteredPost[index]);
    });
  }

  bool get isFilterActive {
    return _selectedTagsController.value.isNotEmpty ||
        _filterTextController.value.isNotEmpty;
  }

  Widget _postItem(PostEntity post) {
    return UserPostWidget(
      post: post,
      navigateToProfileScreen: (v) {
        return widget.navigateToProfileScreen?.call(v);
      },
      onTapTag: addTag,
    );
  }

  Widget get postShimmer {
    return const UserPostWidgetShimmer();
  }

  Widget get searchFieldWidget {
    return ValueListenableBuilder<List<String>>(
        valueListenable: _selectedTagsController,
        builder: (context, tags, _) {
          return Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              top: 16,
              bottom: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SearchFieldWidget(
                  focusNode: _searchFieldFocusNode,
                  onTyping: onTypingSearchField,
                ),
                const SizedBox(
                  height: 16,
                ),
                _tagList(tags),
              ],
            ),
          );
        });
  }

  Widget _tagList(List<String> tagLists) {
    if (tagLists.isEmpty) {
      return const SizedBox();
    }
    return Wrap(
      direction: Axis.horizontal,
      alignment: WrapAlignment.start,
      runAlignment: WrapAlignment.start,
      spacing: 10,
      runSpacing: 10,
      children: tagLists.map((e) {
        return _tagItem(tag: e);
      }).toList(),
    );
  }

  void removeTag(String tag) {
    var s = _selectedTagsController.value;
    if (s.isEmpty) {
      return;
    }
    var indexWhere =
        s.indexWhere((element) => element.toLowerCase() == tag.toLowerCase());
    if (indexWhere > -1) {
      s.removeAt(indexWhere);
    }
    setState(() {
      _selectedTagsController.value = [...s];
    });
    return;
  }

  void addTag(String tag) {
    var s = _selectedTagsController.value;
    if (s.length >= 5) {
      return;
    }
    var indexWhere =
        s.indexWhere((element) => element.toLowerCase() == tag.toLowerCase());
    if (indexWhere < 0) {
      s.add(tag);
    }
    setState(() {
      _selectedTagsController.value = [...s];
    });
    return;
  }

  Widget _tagItem({required String tag}) {
    return OutlinedButton(
        onPressed: () {
          removeTag(tag);
        },
        style: const ButtonStyle(
            padding: MaterialStatePropertyAll(EdgeInsets.all(8))),
        child: Text(
          tag.upperFirstLetterInEachWord,
          style: Theme.of(context)
              .textTheme
              .labelMedium
              ?.copyWith(color: Theme.of(context).colorScheme.primary),
        ));
  }
}
