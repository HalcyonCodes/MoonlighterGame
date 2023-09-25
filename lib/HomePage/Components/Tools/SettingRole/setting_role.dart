import 'dart:io';

import 'package:flutter/material.dart';
import '../../../../PublicWidgets/CommitTitle/commit_title.dart';
import '../../../../Config/index.dart';
import '../../../Model/ViewModel/ToolViewModel/setting_role_view_model.dart';
import 'future_list_expansion_role_item.dart';
import '../../Util/util_tools.dart';
import '../../Util/util_picker.dart';

class SettingRole extends StatelessWidget {
  final ToolUtil toolUtil;
  final PickerUtil pickerUtil;
  final SettingRoleToolViewModel viewModel = SettingRoleToolViewModel();
  SettingRole({super.key, required this.pickerUtil, required this.toolUtil});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width <= 1920
          ? (1920 - 24) / 24 * 7 - 24
          : (1920 - 24) / 24 * 7 - 24,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          CommitTitle(
            iconPath: 'Svg/role_tool.svg',
            title: '${KString.settingRole} ',
            commit: commit,
            cancel: cancel,
          ),
          const SizedBox(
            height: 16,
          ),
          ItemRoleListFuture(
            viewModel: viewModel,
            toolUtil: toolUtil,
            pickerUtil: pickerUtil,
          ),
        ],
      ),
    );
  }

  void commit() async {
    Map<String, dynamic> pickerData = pickerUtil.getPickerRoleListToJsonModel!();
    viewModel.toJson();
    Map<String, dynamic> toolData = viewModel.postData!;
    Map<String, dynamic> postData = {};

    postData['pickerData'] = pickerData;
    postData['toolData'] = toolData;

    int statusCode = await viewModel.updateRole(postData);

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
