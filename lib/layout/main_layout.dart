import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_pocket/core/shared/ui_helpers.dart';
import 'package:my_pocket/locale/app_localizations.g.dart';

class MainLayout extends StatelessWidget {
  final String? name;
  final Widget? child;
  final void Function()? onPressed;
  final void Function()? onTapBack;

  final bool busy;
  final Widget? trailing;

  const MainLayout({
    Key? key,
    this.name,
    this.child,
    this.onPressed,
    this.trailing,
    this.onTapBack,
    this.busy = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
          backgroundColor: Theme.of(context).backgroundColor,
          leading: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: onTapBack ?? () => Navigator.of(context).pop(),
            child: Row(
              children: <Widget>[
                Icon(CupertinoIcons.left_chevron,
                    color: CupertinoColors.activeBlue),
                Text(
                  AppLocalizations.of(context)!.back,
                  style: TextStyle(
                    color: CupertinoColors.activeBlue,
                  ),
                ),
              ],
            ),
          ),
          middle: Text(
            name!,
            style:
                TextStyle(color: Theme.of(context).textTheme.headline2!.color),
            overflow: TextOverflow.ellipsis,
          ),
          trailing: trailing),
      body: AnimatedContainer(
        padding: kPagePadding,
        duration: kAnimationDuration,
        child: Column(
          children: [Expanded(child: Hero(tag: "item", child: child!))],
        ),
      ),
    );
  }
}
