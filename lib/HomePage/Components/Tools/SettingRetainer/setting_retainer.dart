import 'dart:io';

import 'package:flutter/material.dart';
import 'package:moonlighter/HomePage/Components/Tools/SettingRetainer/future_list_expansion_retainer.dart';
import '../../../../Config/index.dart';
import '../../../../PublicWidgets/CommitTitle/commit_title.dart';

import '../../Util/util_tools.dart';
import '../../../Model/ViewModel/ToolViewModel/setting_retainer_view_model.dart';
import '../../Util/util_picker.dart';

class SettingRetainer extends StatelessWidget {
  final ToolUtil toolUtil;
  final PickerUtil pickerUtil;
  final SettingRetainerViewModel viewModel = SettingRetainerViewModel();

  SettingRetainer(
      {super.key, required this.toolUtil, required this.pickerUtil});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        CommitTitle(
          iconPath: 'Svg/retainer_tool.svg',
          title: KString.settingRetainer,
          cancel: cancel,
          commit: commit,
        ),
        const SizedBox(
          height: 16,
        ),
        RetainerListFuture(
          toolUtil: toolUtil,
          viewModel: viewModel,
          pickerUtil: pickerUtil,
        )
      ],
    );
  }

  void commit() async {
    int statusCode = await viewModel.updateRetainer();
    if (statusCode == HttpStatus.ok) {
      //1.提示更新成功
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
