
import 'package:flutter/material.dart';
import 'package:moonlighter/Config/string.dart';

import '../../../../PublicWidgets/AddTitle/add_title.dart';
import './edit_card.dart';
import '../../Util/util_picker.dart';
import '../../../Model/ViewModel/PickerViewModel/setting_role_view_model.dart';
import '../../../Model/FromJsonModel/PickerFromJsonModel/setting_role_from_json_model.dart';

class EditRole extends StatelessWidget {
  final PickerUtil pickerUtil;
  final SettingRolePickerViewModel viewModel;
  const EditRole(
      {super.key, required this.pickerUtil, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          AddTitle(
            iconPath: 'Svg/role_tool.svg',
            title: KString.addRole,
            commit: commit,
          ),
          const SizedBox(
            height: 16,
          ),
          EditCard(
            pickerUtil: pickerUtil,
          ),
        ]);
  }

  void commit() {
    PickerRole role = PickerRole();
    role.roleId = pickerUtil.textCtrs![0].text;
    role.roleName = pickerUtil.textCtrs![1].text;
    role.roleDesc = pickerUtil.textCtrs![2].text;
    role.roleCategory = pickerUtil.textCtrs![3].text;

    viewModel.insertRole(role);
    pickerUtil.refreshPickerRoleList!();
  }
}
