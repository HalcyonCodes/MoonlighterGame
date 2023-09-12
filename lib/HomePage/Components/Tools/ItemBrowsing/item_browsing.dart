import 'package:flutter/material.dart';
import '../../../../Config/index.dart';
import '../../../../PublicWidgets/ToolTitle/title_tool.dart';

import '../../Util/util_tools.dart';
import './future_item_list_expansion_retainer_item.dart';
import '../../../Model/ViewModel/ToolViewModel/item_browsing_view_model.dart';
import '../../Util/util_picker.dart';

class ItemBrowsing extends StatelessWidget {
  final ToolUtil toolUtil;
  final PickerUtil pickerUtil;

  final ItemBrowsingToolViewModel viewModel = ItemBrowsingToolViewModel();

  ItemBrowsing({super.key, required this.toolUtil, required this.pickerUtil});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        ToolTitle(iconPath: 'Svg/item_tool.svg', name: KString.roleRetainer),
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
