import 'package:flutter/material.dart';
import 'package:my_pocket/core/shared/styles.dart';
import 'package:my_pocket/widgets/animation/pulsing_widget.dart';

class ImageWrapperWidget extends StatelessWidget {
  final Widget? child;

  const ImageWrapperWidget({
    Key? key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Positioned(
          top: 0,
          bottom: 0,
          right: 0,
          left: 0,
          child: Center(
              child: PulsingWidget(
                  child: Icon(Icons.all_out,
                      size: 60, color: kcPlaceholderColor))),
        ),
        Opacity(opacity: 0.4, child: child),
      ],
    );
  }
}
