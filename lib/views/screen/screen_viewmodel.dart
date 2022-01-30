import 'package:my_pocket/app/app.locator.dart';
import 'package:my_pocket/app/app.logger.dart';
import 'package:my_pocket/app/app.router.dart';
import 'package:my_pocket/models/file/file_model.dart';
import 'package:my_pocket/models/my_pocket_model/my_pocket_model.dart';
import 'package:my_pocket/services/file.service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ScreenViewModel extends BaseViewModel {
  final log = getLogger('ScreenOneViewModel');
  final _navigationService = locator<NavigationService>();
  final _fileService = locator<FileService>();

  FileModel? _file;

  FileModel? get file => _file;
  MyPocketModel get item => _fileService.pocket;

  void init(FileModel? data) {
    _file = data;
  }

// Rederict to item screen on image tap
  void onImageTap() {
    _navigationService.navigateTo(Routes.itemView,
        arguments: ItemViewArguments(file: file));
  }

// On file uploud button tap
  Future onFileUpload() async {
    return _navigationService.navigateTo(Routes.uploadView);
  }
}
