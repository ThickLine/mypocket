import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:hive/hive.dart';
import 'package:my_pocket/app/app.locator.dart';
import 'package:my_pocket/app/app.logger.dart';
import 'package:my_pocket/core/enum/systemwide_enums.dart';
import 'package:my_pocket/hive/boxes.hive.dart';
import 'package:my_pocket/models/file/file_model.dart';
import 'package:my_pocket/models/my_pocket_model/my_pocket_model.dart';
import 'package:my_pocket/models/setting_model/setting_model.dart';
import 'package:my_pocket/services/file_helper.service.dart';
import 'package:my_pocket/services/translation.service.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:uuid/uuid.dart';

class FileService {
  final log = getLogger('FileService');
  final _fileHelperService = locator<FileHelperService>();
  final _translationService = locator<TranslationService>();
  final _snackBarService = locator<SnackbarService>();

  MyPocketModel _pocket = MyPocketModel(files: [], setting: SettingModel());

  MyPocketModel get pocket => _pocket;

// Init items from db and check for not valid  ones
  Future<void> initItem() async {
    Box<MyPocketModel> box = Boxes.getFile();
    _pocket = await box.get("myFile") ??
        MyPocketModel(files: [], setting: SettingModel());

    await getFilesReady();
  }

  Future<void> updateSettings(SettingModel setting) async {
    _pocket = pocket.copyWith(setting: setting);
    await saveToHive();
  }

// Remove empty items from list and recreate path
  Future<void> getFilesReady() async {
    _pocket.files!.removeWhere((FileModel file) => file.ext == null);
    _pocket.files!.asMap().forEach((int index, FileModel file) {
      pocket.files![index] = pocket.files![index]
          .copyWith(path: _fileHelperService.getPathFromName(file.fileName!));
    });
  }

  Future<bool> saveFile(FileModel data) async {
    try {
      _pocket.files!.add(data);
      await saveToHive();
      return true;
    } catch (e) {
      return false;
    }
  }

// Save to local db
  Future<void> saveToHive() async {
    Box<MyPocketModel> box = await Boxes.getFile();
    box.put("myFile", pocket);
  }

  Future<FileModel> addFile() async {
    var t = _translationService.l();
    Directory? directory;
    FilePickerResult? uploudfile;
    FileModel? file;
    Uuid uuid = Uuid();

    try {
      // Ask for permission and set data
      if (await _fileHelperService.requestPermission(Permission.storage)) {
        directory = Platform.isAndroid
            ? await getExternalStorageDirectory()
            : await getApplicationDocumentsDirectory();
      }

      // Create new directory if it doesn't exist'
      if (!await directory!.exists()) {
        await directory.create(recursive: true);
      }

      // Get file
      if (await directory.exists()) {
        uploudfile = await _fileHelperService
            .selectSingleFile(['jpg', 'png', 'webp', 'svg', 'gif', 'pdf']);
      }
      PlatformFile singleUploadFile = uploudfile!.files.single;

      final String extension = p.extension(singleUploadFile.path!);
      // New file name
      final String fileName = DateTime.now().millisecondsSinceEpoch.toString() +
          singleUploadFile.name;

      File savePath = File(_fileHelperService.getPathFromName(fileName)!);
      // Temp location
      final File fileToSave = File(singleUploadFile.path!);
      // Move to new location
      await _fileHelperService.moveFile(fileToSave, savePath.path);
      // Save file
      file = FileModel(
          uid: uuid.v1(),
          path: savePath.path,
          fileName: fileName,
          ext: extension);

      return file;
    } on StackTrace catch (e) {
      log.e(e);
      _snackBarService.showCustomSnackBar(
          variant: SnackbarType.ERROR,
          message: t.fileUnsuccessfulUploadMessage,
          title: t.fileUnsuccessfulUploadDescription,
          duration: const Duration(seconds: 2));
      throw Exception('Things went wrong $e');
    }
  }

  Future<bool> deleteFile(FileModel file) async {
    try {
      _pocket.files!.removeWhere((FileModel item) => item.uid == file.uid);
      await saveToHive();
      return true;
    } catch (e) {
      log.e(e);
      return false;
    }
  }

  Future<bool> deleteHive() async {
    Box<MyPocketModel> box = Boxes.getFile();
    try {
      await box.clear();
      return true;
    } catch (e) {
      log.e(e);
      return false;
    }
  }
}
