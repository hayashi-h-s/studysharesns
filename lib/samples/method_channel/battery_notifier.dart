import 'package:state_notifier/state_notifier.dart';

import 'battery_data.dart';
import 'battery_repository.dart';

class BatteryNotifier extends StateNotifier<BatteryData> {
  BatteryNotifier() : super(const BatteryData(amount: 0));
  void getBatteryLevel() async {
    BatteryRepository repository = BatteryRepository();
    int amount = await repository.getBatteryLevel();
    state = BatteryData(amount: amount);
  }
}
