import 'package:flutter/material.dart';

import './edit_role.dart';

import '../../../Model/ViewModel/PickerViewModel/setting_role_view_model.dart';
import '../../Util/util_tools.dart';
import '../../Util/util_picker.dart';
import './future_role_list_picker.dart';

class PickerSettingRole extends StatefulWidget {
  final SettingRolePickerViewModel viewModel = SettingRolePickerViewModel();
  final ToolUtil toolUtil;
  final PickerUtil pickerUtil;
  PickerSettingRole({
    super.key,
    required this.toolUtil,
    required this.pickerUtil,
  });

  @override
  State<PickerSettingRole> createState() => _PickerSettingRoleState();
}

class _PickerSettingRoleState extends State<PickerSettingRole> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        EditRole(
          pickerUtil: widget.pickerUtil, viewModel: widget.viewModel,

        ),
        const SizedBox(
          height: 32,
        ),
        PickerRoleListFuture(
          viewModel: widget.viewModel, toolUtil: widget.toolUtil, pickerUtil: widget.pickerUtil,
        )
      ],
    );
  }
}
