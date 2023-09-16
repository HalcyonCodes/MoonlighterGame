import 'package:flutter/material.dart';
import './retainer_search.dart';

import '../../Util/util_picker.dart';
import './future_shelf_retainer.dart';
import '../../../Model/ViewModel/PickerViewModel/setting_shelf_view_model.dart';
import '../../Util/util_tools.dart';

class PickerSettingShelf extends StatelessWidget {
  final PickerUtil pickerUtil;
  final ToolUtil toolUtil;

  final SettingShelfPickerViewModel viewModel = SettingShelfPickerViewModel();
  PickerSettingShelf({super.key, required this.pickerUtil, required this.toolUtil});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        RetainerSearch(viewModel: viewModel,),
        const SizedBox(
          height: 32,
        ),
        RetainerShelfFuture(
          pickerUtil: pickerUtil,
          viewModel: viewModel, toolUtil: toolUtil,
        ),
      ],
    );
  }
}
