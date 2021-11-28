import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:my_pocket/app/app.locator.dart';
import 'package:my_pocket/app/app.logger.dart';
import 'package:my_pocket/core/enum/systemwide_enums.dart' as enums;
import 'package:my_pocket/services/translation.service.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:stacked_services/stacked_services.dart';

class FileHelperService {
  final log = getLogger('FileHelperService');
  final _snackBarService = locator<SnackbarService>();
  final _translationService = locator<TranslationService>();

  Directory? _directory;

  Directory? get directory => _directory;

  Future<Directory?> getDirectory() async {
    return _directory = Platform.isAndroid
        ? await getExternalStorageDirectory()
        : await getApplicationDocumentsDirectory();
  }

  Future<bool> requestPermission(Permission permission) async {
    if (await permission.isGranted) {
      return true;
    } else {
      var result = await permission.request();
      if (result == PermissionStatus.granted) {
        return true;
      }
    }
    return false;
  }

  String? getPathFromName(String name) {
    final file = File("${directory?.path}/$name");
    return file.path;
  }

  Future<FilePickerResult>? selectSingleFile(
      List<String> allowedExtensions) async {
    FilePickerResult? result;
    var t = _translationService.l();
    _hasAcceptedPermissions();
    if (await Permission.storage.status == PermissionStatus.denied) {
      // We didn't ask for permission yet.
      await requestPermission(Permission.storage);
    } else if (await Permission.storage.status == PermissionStatus.granted) {
      // Permission is granted, proceed as expected.
      result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: allowedExtensions,
      );
    } else if (await Permission.storage.status == PermissionStatus.denied) {
      // Permission denied for some reason.
      _snackBarService.showCustomSnackBar(
          variant: enums.SnackbarType.ERROR,
          message: t.fileUnsuccessfulUploadMessage,
          title: t.fileUnsuccessfulUploadDescription,
          duration: const Duration(seconds: 2));
    }

    return result!;
  }

  Future<bool> _hasAcceptedPermissions() async {
    if (Platform.isAndroid) {
      if (await requestPermission(Permission.storage) &&
          // access media location needed for android 10/Q
          await requestPermission(Permission.accessMediaLocation) &&
          // manage external storage needed for android 11/R
          await requestPermission(Permission.manageExternalStorage)) {
        return true;
      } else {
        return false;
      }
    }
    if (Platform.isIOS) {
      if (await requestPermission(Permission.photos)) {
        return true;
      } else {
        return false;
      }
    } else {
      // not android or ios
      return false;
    }
  }

  Future<File> moveFile(File sourceFile, String newPath) async {
    try {
      // prefer using rename as it is probably faster
      return await sourceFile.rename(newPath);
    } on FileSystemException catch (e) {
      log.e(e);
      // if rename fails, copy the source file and then delete it
      final newFile = await sourceFile.copy(newPath);
      await sourceFile.delete();
      return newFile;
    }
  }
}
