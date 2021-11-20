import 'package:flutter/material.dart';
import 'package:my_pocket/app/app.locator.dart';
import 'package:my_pocket/app/app.logger.dart';

import 'package:my_pocket/core/managers/stopable_service.dart';
import 'package:my_pocket/services/translation.service.dart';

/// A manager to start/stop [StoppableService]s when the app goes/returns into/from the background
/// Stop and start long running services
class LifeCycleManager extends StatefulWidget {
  final Widget? child;
  LifeCycleManager({Key? key, this.child}) : super(key: key);

  _LifeCycleManagerState createState() => _LifeCycleManagerState();
}

class _LifeCycleManagerState extends State<LifeCycleManager>
    with WidgetsBindingObserver {
  final log = getLogger('LifeCycleManager');
  List<StoppableService> servicesToManage = [
    locator<TranslationService>(),
  ];

  // Get all services

  @override
  Widget build(BuildContext context) {
    return widget.child!;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance!.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    servicesToManage.forEach((service) {
      log.i('App life cycle change to $state');
      if (state == AppLifecycleState.resumed) {
        service.start();
      } else {
        service.stop();
      }
    });
  }
}
