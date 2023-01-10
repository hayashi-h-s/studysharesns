import 'package:flutter/material.dart';

class BatteryIcon {
  final int amount;

  const BatteryIcon({required this.amount});

  Widget batteryIcon() {
    Color batteryColor = Colors.grey;
    IconData batteryIcon = Icons.battery_alert;
    if (amount >= 20 && amount < 80) {
      batteryColor = Colors.blue;
      batteryIcon = Icons.battery_charging_full;
    } else if (amount >= 80) {
      batteryColor = Colors.green;
      batteryIcon = Icons.battery_full;
    }
    return SizedBox(
      width: 200,
      height: 200,
      child: Icon(
        batteryIcon,
        size: 200,
        color: batteryColor,
      ),
    );
  }
}
