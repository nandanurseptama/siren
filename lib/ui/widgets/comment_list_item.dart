import 'package:flutter/material.dart';
import 'package:siren/cores/interfaces/states/pagination_state.dart';
import 'package:siren/features/post/domain/entity/comment_entity.dart';
import 'package:siren/features/post/presentation/presenters/comments_presenter.dart';
import 'package:siren/ui/widgets/comment_item.dart';

class CommentListItem extends StatefulWidget {
  final String postId;
  final PaginationState<CommentEntity> comments;
  const CommentListItem(
      {super.key, required this.comments, required this.postId});

  @override
  State<CommentListItem> createState() => _CommentListItemState();
}

class _CommentListItemState extends State<CommentListItem> {
  final TextEditingController _textEditingController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          constraints: constraints,
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              _builder(
                  constraints.copyWith(maxHeight: constraints.maxHeight - 70)),
              SizedBox(
                height: 70,
                child: _field(),
              ),
            ],
          ),
        );
      },
    );
  }

  void reset() {
    var ancestorState =
        context.findAncestorStateOfType<CommentsPresenterState>();
    return ancestorState?.reset();
  }

  @override
  void dispose() {
    reset();
    super.dispose();
  }

  Widget _field() {
    return Row(
      children: [
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: TextFormField(
            controller: _textEditingController,
            focusNode: _focusNode,
            validator: commentValidator,
            decoration: InputDecoration(
                hintText: "Write your comment here",
                labelText: "",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                suffixIcon: TextButton(
                  onPressed: sendComment,
                  child: const Text("Send"),
                )),
          ),
        ))
      ],
    );
  }

  String? commentValidator(String? value) {
    if (value == null) {
      return "required";
    }
    if (value.isEmpty) {
      return "required";
    }
    return null;
  }

  void sendComment() {
    var ancestorState =
        context.findAncestorStateOfType<CommentsPresenterState>();
    
    ancestorState?.addComment(
        _textEditingController.text, widget.postId);
    _textEditingController.clear();
    return;
  }

  Widget _builder(BoxConstraints constraints) {
    return Container(
      constraints: constraints,
      alignment: Alignment.topLeft,
      child: widget.comments.maybeMap<Widget>(
        loaded: (value) {
          return _loadedCommentsBuilder(value.results);
        },
        loading: (value) {
          if (value.results?.isNotEmpty == true) {
            return _loadedCommentsBuilder(value.results!);
          }
          return loading;
        },
        orElse: () {
          return loading;
        },
      ),
    );
  }

  Widget get loading {
    return const Center(
        child: SizedBox(
      height: 50,
      width: 50,
      child: CircularProgressIndicator(),
    ));
  }

  Widget empty() {
    return const Center(
      child: Text("No Comments in this post"),
    );
  }

  Widget _loadedCommentsBuilder(List<CommentEntity> comments) {
    if (comments.isEmpty) {
      return empty();
    }
    return _listComments(comments);
  }

  Widget _listComments(List<CommentEntity> comments) {
    return SingleChildScrollView(
        child: Column(
      children: List.generate(comments.length, (index) {
        if (index >= comments.length) {
          return loading;
        }
        return CommentItemWidget(comment: comments[index]);
      }),
    ));
  }
}
