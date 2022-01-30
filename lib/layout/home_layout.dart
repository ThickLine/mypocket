import 'package:flutter/material.dart';
import 'package:my_pocket/core/shared/ui_helpers.dart';
import 'package:my_pocket/widgets/dotted_button.dart';

class HomeLayout extends StatelessWidget {
  final Widget? child;
  final Widget? secondaryWidget;
  final Widget? footerWidget;
  final Widget? toolbar;
  final void Function()? onPressed;
  final bool busy;

  final void Function(String)? onChanged;

  const HomeLayout({
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
    return SizedBox(
      height: kScreenHeightPercentage(context) * 1,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [toolbar!]),
          ),
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.grey,
                        height: 1.5,
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'MY ',
                              style: TextStyle(
                                  fontSize: 30.0, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Pocket',
                              style:
                                  TextStyle(fontSize: 28.0, color: Colors.grey),
                            )
                          ],
                        )),
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.grey,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Column(
                  children: <Widget>[
                    DottedButton(
                      onPressed: onPressed,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Container(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: Column(
                  children: [
                    Expanded(child: child!),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
