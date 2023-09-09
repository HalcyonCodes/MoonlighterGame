import 'package:flutter/material.dart';
import '../../../Model/ViewModel/ToolViewModel/setting_robot_view_model.dart';
import '../../Util/util_tools.dart';
import './list_card_robot.dart';

class RobotListFuture extends StatefulWidget {
  final SettingRobotToolViewModel viewModel;
  final ToolUtil toolUtil;
  const RobotListFuture(
      {super.key, required this.viewModel, required this.toolUtil});

  @override
  State<RobotListFuture> createState() => _RobotListFutureState();
}

class _RobotListFutureState extends State<RobotListFuture> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: widget.viewModel.refresh(widget.toolUtil.listSelectId!),
        builder: (context, snapShot) {
          switch (snapShot.connectionState) {
            case ConnectionState.none:
              return Text('waiting');

            case ConnectionState.waiting:
              return Text('waiting');

            case ConnectionState.active:
              return Text('active');

            case ConnectionState.done:
              return RobotList(viewModel: widget.viewModel, toolUtil: widget.toolUtil);
          }
        });
  }
}
