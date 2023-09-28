import 'dart:io';

import 'package:flutter/material.dart';
import '../../../../Config/index.dart';
import '../../../../PublicWidgets/CommitTitle/commit_title.dart';
import '../../Util/util_tools.dart';
import '../../Util/util_picker.dart';
import '../../../Model/ViewModel/ToolViewModel/setting_channel_view_model.dart';
import './future_list_channel_card.dart';

class SettingChannel extends StatelessWidget {
  final ToolUtil toolUtil;
  final PickerUtil pickerUtil;
  final SettingChannelToolViewModel viewModel = SettingChannelToolViewModel();

  SettingChannel({super.key, required this.toolUtil, required this.pickerUtil});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          CommitTitle(
            iconPath: 'Svg/channel_tool.svg',
            title: KString.settingRobot,
            cancel: cancel,
            commit: commit,
          ),
          const SizedBox(
            height: 16,
          ),
          ChannelCardListFuture(viewMode: viewModel, toolUtil: toolUtil, pickerUtil: pickerUtil,)
        ],
      ),
    );
  }

  void commit() async {
    int statusCode = await viewModel.updateChannel();
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
