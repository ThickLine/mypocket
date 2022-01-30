import 'package:my_pocket/app/app.logger.dart';
import 'package:stacked/stacked.dart';

class UploadCardViewModel extends BaseViewModel {
  final log = getLogger('UploadCardViewModel');

  String _icon = "pdf";
  final List<String> _iconList = ["pdf", "qr", "image"];

  List<String> get iconList => _iconList;
  String get icon => _icon;

  Future<void> init() async {
    return cycleIcon();
  }

  // Shuffles icons on empty upload card
  void cycleIcon() {
    var future = Future(() {});
    for (int i = 0; i < 100; i++) {
      for (var s in iconList) {
        future = future.then((_) {
          return Future.delayed(const Duration(seconds: 2), () {
            _icon = s;
            notifyListeners();
          });
        });
      }
    }
  }
}
