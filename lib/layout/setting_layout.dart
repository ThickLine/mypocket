import 'package:flutter/material.dart';

class SettingLayout extends StatelessWidget {
  final Widget? child;
  final Widget? secondaryWidget;
  final Widget? footerWidget;
  final Widget? toolbar;
  final void Function()? onPressed;
  final bool busy;

  final void Function(String)? onChanged;

  const SettingLayout({
    Key? key,
    this.child,
    this.secondaryWidget,
    this.footerWidget,
    this.onPressed,
    this.toolbar,
    this.busy = false,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [toolbar!]),
        ),
        child!
      ],
    );
  }
}
