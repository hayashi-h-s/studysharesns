import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'battery_data.dart';
import 'battery_icon.dart';
import 'battery_notifier.dart';

final batteryProvider =
    StateNotifierProvider<BatteryNotifier, BatteryData>((ref) {
  return BatteryNotifier();
});

class BatteryLevelScreen extends ConsumerWidget {
  const BatteryLevelScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(batteryProvider);
    final batteryNotifier = ref.read(batteryProvider.notifier);
    BatteryIcon batteryIcon = BatteryIcon(amount: data.amount);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Battery Level'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                onPressed: () => batteryNotifier.getBatteryLevel(),
                child: const Text('Get Battery Level')),
            batteryIcon.batteryIcon(),
            Text(_getBatteryLevel(data.amount))
          ],
        ),
      ),
    );
  }

  String _getBatteryLevel(int amount) {
    return 'Battery level at $amount % .';
  }
}
