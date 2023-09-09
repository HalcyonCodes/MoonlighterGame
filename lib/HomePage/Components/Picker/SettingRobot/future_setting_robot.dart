import 'package:flutter/material.dart';

import '../../../Model/ViewModel/PickerViewModel/setting_robot_view_model.dart';
import './setting_robot.dart';
import '../../Util/util_tools.dart';

class PickerSettingRobotFuture extends StatefulWidget {
  final SettingRobotPickerViewModel viewModel = SettingRobotPickerViewModel();
  final ToolUtil toolUtil;

  PickerSettingRobotFuture({super.key,  required this.toolUtil});

  @override
  State<PickerSettingRobotFuture> createState() =>
      _PickerSettingRobotFutureState();
}

class _PickerSettingRobotFutureState extends State<PickerSettingRobotFuture> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: widget.viewModel.refresh(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Text('none');
            case ConnectionState.waiting:
              return Text('waiting');
            case ConnectionState.active:
              return Text('active');
            case ConnectionState.done:
              return PickerSettingRobot(toolUtil: widget.toolUtil, viewModel: widget.viewModel,);
          }
        });
  }
}
