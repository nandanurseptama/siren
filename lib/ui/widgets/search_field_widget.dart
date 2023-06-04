import 'dart:async';

import 'package:flutter/material.dart';

class SearchFieldWidget extends StatefulWidget {
  final FocusNode? focusNode;
  final ValueChanged<String>? onTyping;
  final String labelText, hintText;
  const SearchFieldWidget(
      {super.key,
      this.focusNode,
      this.onTyping,
      this.labelText = "Search",
      this.hintText = "Type post's text or post's tag"});

  @override
  State<SearchFieldWidget> createState() => _SearchFieldWidgetState();
}

class _SearchFieldWidgetState extends State<SearchFieldWidget> {
  final TextEditingController _textEditingController = TextEditingController();
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _textEditingController.addListener(() {
        onChanged(_textEditingController.text);
      });
    });
  }

  void onChanged(String value) {
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
    }
    _timer = Timer(const Duration(seconds: 1), timerCallback.call);
    return;
  }

  void Function() get timerCallback {
    return () {
      debugPrint(
          "timerCallback _textEditingController.text ${_textEditingController.text}");
      widget.onTyping?.call(_textEditingController.text);
      _timer?.cancel();
      return;
    };
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: widget.focusNode,
      controller: _textEditingController,
      decoration: InputDecoration(
          labelText: widget.labelText, hintText: widget.hintText),
    );
  }
}
