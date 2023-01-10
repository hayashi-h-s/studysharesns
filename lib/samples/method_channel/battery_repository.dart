import 'package:flutter/services.dart';

class BatteryRepository {
  // Native側のメソッドを呼び出す
  static const platform = MethodChannel('samples.flutter.dev/battery');

  Future<int> getBatteryLevel() async {
    int amount = 0;
    try {
      amount = await platform.invokeMethod('getBatteryLevel');
      // ignore: empty_catches
    } on PlatformException {}
    return amount;
  }
}
