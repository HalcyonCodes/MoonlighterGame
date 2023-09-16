import 'package:flutter/material.dart';
import '../../../../Config/index.dart';
import '../../../../PublicWidgets/ToolTitle/title_tool.dart';
import '../../Util/util_tools.dart';
import '../../../Model/ViewModel/ToolViewModel/setting_shelf_view_model.dart';
import './future_list_expansion_retainer_item.dart';
import '../../Util/util_picker.dart';

class SettingShelf extends StatelessWidget {
  final ToolUtil toolUtil;
  final PickerUtil pickerUtil;
  final SettingShelfToolViewModel viewModel = SettingShelfToolViewModel();

  SettingShelf({
    super.key,
    required this.toolUtil,
    required this.pickerUtil
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        ToolTitle(
            iconPath: 'Svg/retainer_tool.svg', name: KString.roleRetainer),
        const SizedBox(
          height: 16,
        ),
        ItemRetainerListFuture(
          toolUtil: toolUtil,
          viewModel: viewModel,
          pickerUtil: pickerUtil,
        )
      ],
    );
  }
}
