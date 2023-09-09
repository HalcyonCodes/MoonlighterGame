import 'dart:io';

import 'package:flutter/material.dart';
import 'package:moonlighter/HomePage/Components/Tools/SettingTag/list_tag.dart';
import '../../../../PublicWidgets/CommitTitle/commit_title.dart';
import '../../../../Config/index.dart';
import '../../../Model/ViewModel/ToolViewModel/setting_tag_view_model.dart';
import '../../Util/util_tools.dart';
import '../../Util/util_picker.dart';

class SettingTag extends StatelessWidget {
  final SettingTagToolViewModel viewModel;
  final ToolUtil toolUtil;
  final PickerUtil pickerUtil;

  const SettingTag(
      {super.key,
      required this.toolUtil,
      required this.viewModel,
      required this.pickerUtil});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          CommitTitle(
            iconPath: 'Svg/tag_tool.svg',
            title: KString.settingTag,
            cancel: cancel,
            commit: commit,
          ),
          const SizedBox(
            height: 16,
          ),
          TagList(
            viewModel: viewModel,
            toolUtil: toolUtil,
          )
        ],
      ),
    );
  }

  void commit() async {
    int statusCode = await viewModel.changeTags();
    if (statusCode == HttpStatus.ok) {
      print('成功');
      //提示修改成功
      toolUtil.changeTool!(15);
      pickerUtil.changePickerCurrentIndex!(15);
    } else {
      //提示修改失败
    }
  }

  void cancel() {
    toolUtil.changeTool!(15);
    pickerUtil.changePickerCurrentIndex!(15);
  }
}
