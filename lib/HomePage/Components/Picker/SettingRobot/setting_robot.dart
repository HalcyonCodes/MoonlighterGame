import 'package:flutter/material.dart';
import './card_list_robot.dart';

class PickerSettingRobot extends StatelessWidget {
  const PickerSettingRobot({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 24 - 24,
        width: MediaQuery.of(context).size.width <= 1920
          ? (1920 - 24) / 24 * 8 - 24
          : (1920 - 24) / 24 * 8 - 24,
      child: PickerRobotCardList());
  }
}
