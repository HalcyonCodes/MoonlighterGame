import 'dart:io';

import 'package:flutter/material.dart';
import '../../../../Config/index.dart';
import '../../../../PublicWidgets/CommitTitle/commit_title.dart';
import 'future_list_card_robot.dart';
import '../../Util/util_tools.dart';
import '../../../Model/ViewModel/ToolViewModel/setting_robot_view_model.dart';
import '../../Util/util_picker.dart';

class SettingRobot extends StatelessWidget {
  final SettingRobotToolViewModel viewModel = SettingRobotToolViewModel();
  final ToolUtil toolUtil;
  final PickerUtil pickerUtil;

  SettingRobot({super.key, required this.toolUtil, required this.pickerUtil});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          CommitTitle(
            iconPath: 'Svg/robot_tool.svg',
            title: KString.settingRobot,
            cancel: cancel,
            commit: commit,
          ),
          const SizedBox(
            height: 16,
          ),
          RobotListFuture(viewModel: viewModel, toolUtil: toolUtil)
        ],
      ),
    );
  }

  void commit() async {
    int statusCode = await viewModel.updateRobot();
    if (statusCode == HttpStatus.ok) {
      //1.提示更新成功
      print('成功');
      //2.关闭
      toolUtil.changeTool!(15);
      pickerUtil.changePickerCurrentIndex!(15);
    } else {
      //1.提示更新失败
    }
  }

  void cancel() {
    toolUtil.changeTool!(15);
    pickerUtil.changePickerCurrentIndex!(15);
  }
}
