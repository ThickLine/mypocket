// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../models/file/file_model.dart';
import '../views/fullscreen/fullscreen_view.dart';
import '../views/item/item_view.dart';
import '../views/main/main_view.dart';
import '../views/setting/setting_view.dart';
import '../views/startup/startup_view.dart';
import '../views/upload/uploud_view.dart';

class Routes {
  static const String startUpView = '/';
  static const String mainView = '/main-view';
  static const String itemView = '/item-view';
  static const String uploadView = '/upload-view';
  static const String fullScreenView = '/full-screen-view';
  static const String settingView = '/setting-view';
  static const all = <String>{
    startUpView,
    mainView,
    itemView,
    uploadView,
    fullScreenView,
    settingView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.startUpView, page: StartUpView),
    RouteDef(Routes.mainView, page: MainView),
    RouteDef(Routes.itemView, page: ItemView),
    RouteDef(Routes.uploadView, page: UploadView),
    RouteDef(Routes.fullScreenView, page: FullScreenView),
    RouteDef(Routes.settingView, page: SettingView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    StartUpView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const StartUpView(),
        settings: data,
      );
    },
    MainView: (data) {
      var args = data.getArgs<MainViewArguments>(
        orElse: () => MainViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => MainView(
          key: args.key,
          initialPage: args.initialPage,
        ),
        settings: data,
      );
    },
    ItemView: (data) {
      var args = data.getArgs<ItemViewArguments>(
        orElse: () => ItemViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => ItemView(
          key: args.key,
          file: args.file,
        ),
        settings: data,
      );
    },
    UploadView: (data) {
      var args = data.getArgs<UploadViewArguments>(
        orElse: () => UploadViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => UploadView(
          key: args.key,
          preview: args.preview,
        ),
        settings: data,
      );
    },
    FullScreenView: (data) {
      var args = data.getArgs<FullScreenViewArguments>(
        orElse: () => FullScreenViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => FullScreenView(
          key: args.key,
          file: args.file,
        ),
        settings: data,
      );
    },
    SettingView: (data) {
      var args = data.getArgs<SettingViewArguments>(
        orElse: () => SettingViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => SettingView(
          key: args.key,
          file: args.file,
        ),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// MainView arguments holder class
class MainViewArguments {
  final Key? key;
  final int? initialPage;
  MainViewArguments({this.key, this.initialPage = 0});
}

/// ItemView arguments holder class
class ItemViewArguments {
  final Key? key;
  final FileModel? file;
  ItemViewArguments({this.key, this.file});
}

/// UploadView arguments holder class
class UploadViewArguments {
  final Key? key;
  final bool preview;
  UploadViewArguments({this.key, this.preview = false});
}

/// FullScreenView arguments holder class
class FullScreenViewArguments {
  final Key? key;
  final FileModel? file;
  FullScreenViewArguments({this.key, this.file});
}

/// SettingView arguments holder class
class SettingViewArguments {
  final Key? key;
  final FileModel? file;
  SettingViewArguments({this.key, this.file});
}
