import 'package:my_pocket/app/app.locator.dart';
import 'package:my_pocket/app/app.logger.dart';
import 'package:my_pocket/app/app.router.dart';
import 'package:my_pocket/models/file/file_model.dart';
import 'package:my_pocket/models/my_pocket_model/my_pocket_model.dart';
import 'package:my_pocket/services/file.service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:my_pocket/views/upload/uploud_view.form.dart';

class UploadViewModel extends FormViewModel {
  final log = getLogger('UploadViewModel');
  final _fileService = locator<FileService>();
  final _navigationService = locator<NavigationService>();

  FileModel _file = FileModel();

  FileModel get file => _file;
  MyPocketModel get pocket => _fileService.pocket;

  @override
  void setFormStatus() {}

  Future<void> init() async {
    setBusy(true);
    Future.delayed(const Duration(seconds: 1), () => setBusy(false));
  }

// On file upload tap
  Future<void> onUploadFile() async {
    _file = await _fileService.addFile();
    notifyListeners();
  }

// On aproved file save
  Future<void> onAddFile() async {
    if (nameValue != null) _file = file.copyWith(name: nameValue);
    if (file.path == null) return;
    var res = await _fileService.saveFile(file);

    if (res == true) onRouteBack();
  }

// On file reset tap
  Future<void> onResetFile() async {
    _file = FileModel();
    notifyListeners();
  }

  /// On tap back route to [Main view]
  void onRouteBack() {
    _navigationService.navigateTo(Routes.mainView);
  }
}
