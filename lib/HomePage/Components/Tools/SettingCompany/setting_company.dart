import 'dart:io';

import 'package:flutter/material.dart';
import '../../Util/util_tools.dart';
import '../../../../PublicWidgets/CommitTitle/commit_title.dart';
import '../../../../Config/index.dart';
import './future_role_company_card_list.dart';
import '../../../Model/ViewModel/ToolViewModel/setting_company_view_model.dart';
import '../../Util/util_picker.dart';

class SettingCompany extends StatelessWidget {
  final ToolUtil toolUtil;
  final PickerUtil pickerUtil;
  final SettingCompanyToolViewModel viewModel = SettingCompanyToolViewModel();

  SettingCompany({super.key, required this.toolUtil, required this.pickerUtil});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        CommitTitle(
          iconPath: 'Svg/company_tool.svg',
          title: KString.settingCompany,
          cancel: cancel,
          commit: commit,
        ),
        const SizedBox(
          height: 16,
        ),
        RoleCompanyCardListFuture(
          toolUtil: toolUtil,
          viewModel: viewModel,
        ),
      ],
    );
  }

  void commit() async {
    int statusCode = await viewModel.upDataCompany();
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
