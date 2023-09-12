import 'package:flutter/material.dart';
import './edit_retainer.dart';

import './future_retainer_list_picker.dart';
import '../../../Model/ViewModel/PickerViewModel/setting_retainer_view_model.dart';
import '../../Util/util_picker.dart';
import '../../Util/util_tools.dart';

class PickerSettingRetainer extends StatelessWidget {
  final SettingRetainerPickerViewModel viewModel =
      SettingRetainerPickerViewModel();

  final PickerUtil pickerUtil;
  final ToolUtil toolUtil;

  PickerSettingRetainer({super.key, required this.pickerUtil, required this.toolUtil});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          EditRetainer(pickerUtil: pickerUtil, viewModel: viewModel,),
          const SizedBox(
            height: 32,
          ),
          PickerRetainerListFuture(
              viewModel: viewModel, toolUtil: toolUtil, pickerUtil: pickerUtil)
        ]);
  }
}
