import 'package:hive/hive.dart';
import 'package:my_pocket/models/my_pocket_model/my_pocket_model.dart';

class Boxes {
  static Box<MyPocketModel> getFile() => Hive.box<MyPocketModel>("myFile");
}
