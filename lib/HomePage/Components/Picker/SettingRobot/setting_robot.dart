import 'package:flutter/material.dart';
import './card_list_robot.dart';
import '../../Util/util_tools.dart';
import '../../../Model/ViewModel/PickerViewModel/setting_robot_view_model.dart';

class PickerSettingRobot extends StatelessWidget {
  final SettingRobotPickerViewModel viewModel;
  final ToolUtil toolUtil;
  const PickerSettingRobot({super.key, required this.toolUtil, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 24 - 24,
        width: MediaQuery.of(context).size.width <= 1920
          ? (1920 - 24) / 24 * 8 - 24
          : (1920 - 24) / 24 * 8 - 24,
      child: PickerRobotCardList(
        toolUtil: toolUtil,
        viewModel: viewModel,
      ));
  }
}
