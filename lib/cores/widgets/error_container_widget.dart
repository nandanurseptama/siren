// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:siren/cores/assets.dart';
import 'package:siren/cores/utils/snackbar.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class ErrorContainerWidget extends StatelessWidget {
  final String message, assetPath;
  final VoidCallback? onReload;
  final String errorTicketId;
  const ErrorContainerWidget(
      {super.key,
      this.message = "",
      this.assetPath = AssetImagePath.commonErrorAsset,
      this.onReload,
      this.errorTicketId = ""});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          constraints: constraints,
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                errorImage(),
                textError(),
                copyErrorTicketButton(context),
                reload()
              ],
            ),
          ),
        );
      },
    );
  }

  Widget errorImage() {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: SvgPicture.asset(
        assetPath,
        fit: BoxFit.fitWidth,
        placeholderBuilder: (context) {
          return const CircularProgressIndicator();
        },
      ),
    );
  }

  Widget reload() {
    if(onReload == null){
      return const SizedBox();
    }
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: FilledButton(
        onPressed: onReload,
        child: const Text("Reload"),
      ),
    );
  }

  Widget copyErrorTicketButton(BuildContext context) {
    if (errorTicketId.isEmpty) {
      return const SizedBox();
    }
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: TextButton(
        onPressed: () => onCopy(context),
        child: const Text("Copy Error Ticket"),
      ),
    );
  }

  Widget textError() {
    if (message.isEmpty) {
      return const SizedBox();
    }
    return Builder(
      builder: (context) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text(
                  message,
                  maxLines: 3,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w600
                  ),
                ),
              ),
            )
          ],
        );
      }
    );
  }

  void onCopy(BuildContext context) async {
    await Clipboard.setData(ClipboardData(text: errorTicketId));
    showSnackbarMessage(
        context: context, message: "Copied", type: SnackbarType.info);
    return;
  }
}
