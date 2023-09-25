import 'package:flutter/material.dart';

import '../../Util/util_tools.dart';
import 'list_expansion_role_item.dart';
import '../../Util/util_picker.dart';
import '../../../Model/ViewModel/ToolViewModel/setting_role_view_model.dart';

class ItemRoleListFuture extends StatelessWidget {
  final SettingRoleToolViewModel viewModel;
  final ToolUtil toolUtil;
  final PickerUtil pickerUtil;

  const ItemRoleListFuture(
      {super.key, required this.viewModel, required this.toolUtil, required this.pickerUtil});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: viewModel.refresh(toolUtil.listSelectId!),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Text('none');
            case ConnectionState.waiting:
              return Text('waiting');
            case ConnectionState.active:
              return Text('active');
            case ConnectionState.done:
              return ItemRoleList(
                toolUtil: toolUtil,
                pickerUtil: pickerUtil,
                viewModel: viewModel,
              );
          }
        });
  }
}
