import 'package:flutter/material.dart';
import 'package:my_pocket/core/shared/styles.dart';
import 'package:my_pocket/core/shared/ui_helpers.dart';
import 'package:my_pocket/views/startup/startup_viewmodel.dart';
import 'package:my_pocket/widgets/animation/login_button.dart';

import 'package:stacked/stacked.dart';

class StartUpView extends StatelessWidget {
  const StartUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartUpViewModel>.reactive(
      disposeViewModel: false,
      onModelReady: (model) => model.handleMove(),
      builder: (context, model, child) => Scaffold(
        body: Container(
          height: kScreenHeightPercentage(context) * 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/logo.png"),
                  ],
                ),
              ),
              AnimatedCrossFade(
                duration: const Duration(seconds: 1),
                firstChild: Container(),
                secondChild: LoginButton(
                  onPressed: model.onAuth,
                ),
                crossFadeState: model.delay == true
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
              ),
              kVerticalSpaceTiny
            ],
          ),
        ),
        backgroundColor: kcBlackColor,
      ),
      viewModelBuilder: () => StartUpViewModel(),
    );
  }
}
