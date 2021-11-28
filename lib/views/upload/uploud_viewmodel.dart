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
  String _icon = "pdf";
  List<String> _iconList = ["pdf", "qr", "image"];

  FileModel get file => _file;
  MyPocketModel get pocket => _fileService.pocket;
  dynamic get iconList => _iconList;
  String get icon => _icon;

  @override
  void setFormStatus() {}

  Future<void> init() async {
    setBusy(true);
    Future.delayed(const Duration(seconds: 1), () => setBusy(false));
    return cycleIcon();
  }

// On file upload tap
  Future<void> uploadFile() async {
    _file = await _fileService.addFile();
    notifyListeners();
  }

// Shuffles icons on empty upload card
  void cycleIcon() {
    var future = Future(() {});
    for (int i = 0; i < 100; i++) {
      iconList.forEach((String s) {
        future = future.then((_) {
          return Future.delayed(Duration(seconds: 2), () {
            _icon = s;
            notifyListeners();
          });
        });
      });
    }
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
