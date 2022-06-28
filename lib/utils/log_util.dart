import 'package:flutter/foundation.dart';

class LogUtils {
  static void outputLog(String errorLog) {
    if (kDebugMode) {
      print(errorLog);
    }
  }
}
