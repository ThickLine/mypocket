import 'package:intl/intl.dart';

class UtilMixin {
  static String getDate() {
    return DateFormat.yMMMMd().format(DateTime.now()).toString();
  }
}
