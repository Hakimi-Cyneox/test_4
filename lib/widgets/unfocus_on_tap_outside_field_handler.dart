import 'package:flutter/material.dart';

/// {@template unfocus_on_tap_outside_field_handler.UnfocusOnTapOutsideFieldHandler}
///
/// Handle unfocus when the user taps outside of the field.
///
/// This method allows the user to dismiss keyboard after tapping outside of the
/// field.
///
/// {@endtemplate}
class UnfocusOnTapOutsideFieldHandler extends StatelessWidget {
  /// {@macro unfocus_on_tap_outside_field_handler.UnfocusOnTapOutsideFieldHandler}
  const UnfocusOnTapOutsideFieldHandler({
    super.key,
    required this.child,
  });

  /// The root widget to handle this behavior.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: child,
    );
  }
}
