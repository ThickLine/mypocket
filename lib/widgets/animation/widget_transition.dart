import 'package:flutter/material.dart';

class WidgetTransition extends StatelessWidget {
  final Widget? child;

  const WidgetTransition({Key? key, this.child}) : super(key: key);

  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 600),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return SlideTransition(
          child: child,
          position:
              Tween(begin: const Offset(1.0, 0.0), end: const Offset(0.0, 0.0))
                  .animate(animation),
        );
      },
      child: child,
    );
  }
}
