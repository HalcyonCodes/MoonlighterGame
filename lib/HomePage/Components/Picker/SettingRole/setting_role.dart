

import 'package:flutter/material.dart';
import '../../../../PublicWidgets/AddTitle/add_title.dart';
import '../../../../Config/index.dart';
import './edit_role.dart';
import './role_list_picker.dart';

class PickerSettingRole extends StatefulWidget {
  const PickerSettingRole({super.key});

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
        EditRole(),
        const SizedBox(height: 32,),
        PickerRoleList()


      ],
    );
  }
}