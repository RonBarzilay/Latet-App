import 'dart:math' as math;
import 'dart:ui' show lerpDouble;

import 'package:flutter/material.dart';

class Button extends ElevatedButton {
  Button({
    Key? key,
    required VoidCallback? onPressed,
    VoidCallback? onLongPress,
    ValueChanged<bool>? onHover,
    ValueChanged<bool>? onFocusChange,
    ButtonStyle? style,
    FocusNode? focusNode,
    bool autofocus = false,
    Clip clipBehavior = Clip.none,
    required Widget icon,
    required Widget label,
    Widget? child,
  })  : assert(icon != null),
        assert(label != null),
        super(
          key: key,
          onPressed: onPressed,
          onLongPress: onLongPress,
          onHover: onHover,
          onFocusChange: onFocusChange,
          style: ElevatedButton.styleFrom(
              primary: Colors.lightGreen[10],
              onPrimary: Colors.white,
              shadowColor: Colors.lightBlue,
              elevation: 8,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0)),
              minimumSize: Size(150, 70)),
          focusNode: focusNode,
          autofocus: autofocus,
          clipBehavior: clipBehavior,
          child: buttonChild(icon: icon, label: label),
        );

  Button.unitIconBuiltIn({
    Key? key,
    required VoidCallback? onPressed,
    VoidCallback? onLongPress,
    ValueChanged<bool>? onHover,
    ValueChanged<bool>? onFocusChange,
    ButtonStyle? style,
    FocusNode? focusNode,
    bool autofocus = false,
    Clip clipBehavior = Clip.none,
    required Widget label,
    Widget? child,
  })  : assert(label != null),
        super(
          key: key,
          onPressed: onPressed,
          onLongPress: onLongPress,
          onHover: onHover,
          onFocusChange: onFocusChange,
          style: ElevatedButton.styleFrom(
              primary: Color(0xFF4D61BF),
              onPrimary: Colors.white,
              // shadowColor: Colors.lightBlue,
              elevation: 8,
              textStyle:
                  TextStyle(fontFamily: 'VarelaRound-Regular', fontSize: 16.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              minimumSize: Size(162, 70)),
          focusNode: focusNode,
          autofocus: autofocus,
          clipBehavior: clipBehavior,
          child: buttonChild(
              icon: const Icon(
                Icons.location_on_outlined,
                color: Colors.green,
                size: 30.0,
              ),
              label: label),
        );

  Button.populationIconBuiltIn({
    Key? key,
    required VoidCallback? onPressed,
    VoidCallback? onLongPress,
    ValueChanged<bool>? onHover,
    ValueChanged<bool>? onFocusChange,
    ButtonStyle? style,
    FocusNode? focusNode,
    bool autofocus = false,
    Clip clipBehavior = Clip.none,
    required Widget label,
    Widget? child,
  })  : assert(label != null),
        super(
          key: key,
          onPressed: onPressed,
          onLongPress: onLongPress,
          onHover: onHover,
          onFocusChange: onFocusChange,
          style: ElevatedButton.styleFrom(
              primary: Color(0xFF4D61BF),
              onPrimary: Colors.white,
              // shadowColor: Colors.lightBlue,
              elevation: 8,
              textStyle:
                  TextStyle(fontFamily: 'VarelaRound-Regular', fontSize: 16.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              minimumSize: Size(300, 70)),
          focusNode: focusNode,
          autofocus: autofocus,
          clipBehavior: clipBehavior,
          child: buttonChild(
              icon: const Icon(
                Icons.family_restroom_outlined,
                color: Colors.green,
                size: 30.0,
              ),
              label: label),
        );

  Button.actionIconBuiltIn({
    Key? key,
    required VoidCallback? onPressed,
    VoidCallback? onLongPress,
    ValueChanged<bool>? onHover,
    ValueChanged<bool>? onFocusChange,
    ButtonStyle? style,
    FocusNode? focusNode,
    bool autofocus = false,
    Clip clipBehavior = Clip.none,
    required Widget icon,
    required Widget label,
    Widget? child,
  })  : assert(icon != null),
        assert(label != null),
        super(
          key: key,
          onPressed: onPressed,
          onLongPress: onLongPress,
          onHover: onHover,
          onFocusChange: onFocusChange,
          style: ElevatedButton.styleFrom(
              primary: Color(0xFF4D61BF),
              onPrimary: Colors.white,
              // shadowColor: Colors.lightBlue,
              elevation: 8,
              textStyle:
                  TextStyle(fontFamily: 'VarelaRound-Regular', fontSize: 16.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              minimumSize: Size(300, 70)),
          focusNode: focusNode,
          autofocus: autofocus,
          clipBehavior: clipBehavior,
          child: buttonChild(icon: icon, label: label),
        );
}

class buttonChild extends StatelessWidget {
  const buttonChild({Key? key, required this.label, required this.icon})
      : super(key: key);

  final Widget label;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    final double scale = MediaQuery.maybeOf(context)?.textScaleFactor ?? 1;
    final double gap =
        scale <= 1 ? 8 : lerpDouble(8, 4, math.min(scale - 1, 1))!;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[icon, SizedBox(width: gap), Flexible(child: label)],
    );
  }
}
