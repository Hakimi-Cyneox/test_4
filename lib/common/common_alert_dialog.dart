import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yayasan_app/common/common_button.dart';
import 'package:yayasan_app/common/common_text_style.dart';

class _CustomAlertDialog extends StatefulWidget {
  const _CustomAlertDialog(
      {Key? key,
      this.title,
      this.content,
      this.actions,
      this.barrierDismissible = true})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _CustomAlertDialogState();

  final Widget? title;
  final Widget? content;
  final List<Widget>? actions;
  final bool barrierDismissible;

  Future<void> show(BuildContext context) async {
    return await showDialog<void>(
        context: context,
        barrierDismissible: barrierDismissible,
        builder: (context) {
          return this;
        });
  }
}

class _CustomAlertDialogState extends State<_CustomAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: widget.title != null
          ? DefaultTextStyle(
              style:
                  const TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0),
              child: widget.title!)
          : null,
      content: widget.content,
      actions: widget.actions,
    );
  }
}

customDialog(
  BuildContext context, {
  String title = '',
  String message = '',
  VoidCallback? onPressed,
  bool isConfirmation = true,
}) {
  return _CustomAlertDialog(
    barrierDismissible: false,
    title: Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Text(
        title,
        style: TextStyles.regularStyle(size: 14.0),
      ),
    ),
    content: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            message,
            style: TextStyles.regularStyle(size: 14.0),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Row(
            children: [
              if (isConfirmation)
                Flexible(
                  child: CommonButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'cancel'.tr.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                ),
              if (isConfirmation)
                const SizedBox(
                  width: 10.0,
                ),
              Flexible(
                child: CommonButton(
                  onPressed: onPressed ??
                      () {
                        Navigator.pop(context);
                      },
                  child: Text(
                    'ok'.tr.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  ).show(context);
}
