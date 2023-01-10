import 'package:flutter/services.dart';

class AndroidActivityRepository {
  // Native側のメソッドを呼び出す
  static const platform = MethodChannel('com.sample.sample/activity');

  Future _launchNativeScreen() async {
    await platform.invokeMethod('show_activity');
  }
}
