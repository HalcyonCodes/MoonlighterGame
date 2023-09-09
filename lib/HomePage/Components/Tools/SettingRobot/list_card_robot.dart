import 'package:flutter/material.dart';
import '../../../Model/ViewModel/ToolViewModel/setting_robot_view_model.dart';
import './card_robot.dart';
import '../../../Model/FromJsonModel/PickerFromJsonModel/setting_robot_from_json_model.dart';
import '../../../Model/FromJsonModel/ToolFromJsonModel/setting_robot_from_json_model.dart';
import '../../Util/util_tools.dart';

class RobotList extends StatefulWidget {
  final SettingRobotToolViewModel viewModel;
  final ToolUtil toolUtil;
  const RobotList({super.key, required this.viewModel, required this.toolUtil});

  @override
  State<RobotList> createState() => _RobotListState();
}

class _RobotListState extends State<RobotList> {
  List<Widget>? items;

  @override
  void initState() {
    super.initState();
    items = [];

    //注册
    widget.toolUtil.setFuncAddViewModelRobot(addRobot);
  }

  @override
  Widget build(BuildContext context) {
    items = List.generate(
        widget.viewModel.settingRobotToolModel!.data.robots!.length, (index) {
      return RobotCard(
          id: widget
              .viewModel.settingRobotToolModel!.data.robots![index].robotId,
          date: widget.viewModel.settingRobotToolModel!.data.robots![index]
              .robotCreateDate,
          name: widget
              .viewModel.settingRobotToolModel!.data.robots![index].robotName,
          profile: widget.viewModel.settingRobotToolModel!.data.robots![index]
              .robotProfile,
          bindingCount: widget
              .viewModel.settingRobotToolModel!.data.robots![index].bidingCount,
          scripCount: widget
              .viewModel.settingRobotToolModel!.data.robots![index].scriptCount,
          onTap: () {
            onTap(index);
          });
    });

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: items!,
    );
  }

  void refreshUi() {
    setState(() {});
  }

  void onTap(int index) {
    items!.removeAt(index);
    widget.viewModel.settingRobotToolModel!.data.robots!.removeAt(index);
    refreshUi();
  }

  void addRobot(PickerRobot pickerRobot) {
    if (widget.viewModel.settingRobotToolModel!.data.robots!.isEmpty) {
      Robot robot = Robot();
      robot.robotId = pickerRobot.robotId;
      robot.robotName = pickerRobot.robotName;
      robot.robotProfile = pickerRobot.robotProfile;
      robot.robotCreateDate = pickerRobot.robotCreateDate;
      robot.bidingCount = pickerRobot.bidingCount;
      robot.scriptCount = pickerRobot.scriptCount;
      widget.viewModel.settingRobotToolModel!.data.robots!.add(robot);
      refreshUi();
    }
  }
}
