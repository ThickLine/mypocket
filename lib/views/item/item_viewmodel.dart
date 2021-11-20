import 'package:my_pocket/app/app.locator.dart';
import 'package:my_pocket/app/app.logger.dart';
import 'package:my_pocket/app/app.router.dart';
import 'package:my_pocket/models/file/file_model.dart';
import 'package:my_pocket/models/my_pocket_model/my_pocket_model.dart';
import 'package:my_pocket/services/file.service.dart';
import 'package:my_pocket/services/translation.service.dart';
import 'package:open_file/open_file.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ItemViewModel extends BaseViewModel {
  final log = getLogger('ItemViewModel');
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();
  final _fileService = locator<FileService>();
  final _translationService = locator<TranslationService>();

  FileModel? _file;

  FileModel? get file => _file;
  MyPocketModel get pocket => _fileService.pocket;

  void init(FileModel? data) {
    _file = data;
  }

// Open file natively
  Future<void> openFile(String path) async {
    await OpenFile.open(path);
  }

// delete item localy
  Future<void> onDelete() async {
    var t = _translationService.l();
    if (file == null) return;

    var dialog = await _dialogService.showConfirmationDialog(
        title: t.deleteTitle,
        description: t.deleteQuestion,
        cancelTitle: t.cancel,
        confirmationTitle: t.confirm);
    if (dialog!.confirmed) {
      var res = await _fileService.deleteFile(file!);
      if (res == true) _navigationService.replaceWith(Routes.mainView);
    }
  }

// Navigate to file fullscreen preview
  void onFullScreenTap() {
    _navigationService.navigateTo(Routes.fullScreenView,
        arguments: FullScreenViewArguments(file: file));
  }
}
