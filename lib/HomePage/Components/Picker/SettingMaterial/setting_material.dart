import 'package:flutter/material.dart';
import './retainer_search.dart';
import 'future_retainer_material.dart';
import '../../Util/util_picker.dart';
import '../../Util/util_tools.dart';
import '../../../Model/ViewModel/PickerViewModel/setting_material_view_model.dart';

class PickerSettingMaterial extends StatelessWidget {
  final PickerUtil pickerUtil;
  final ToolUtil toolUtil;
  final SettingMaterialPickerViewModel viewModel = SettingMaterialPickerViewModel();
  PickerSettingMaterial({super.key, required this.pickerUtil, required this.toolUtil,});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        RetainerSearch(
          pickerUtil: pickerUtil, toolUtil: toolUtil, viewModel: viewModel,
        ),
        const SizedBox(
          height: 32,
        ),
        RetainerMaterialFuture(
          pickerUtil: pickerUtil, toolUtil: toolUtil, viewModel: viewModel,
        ),
      ],
    );
  }
}
