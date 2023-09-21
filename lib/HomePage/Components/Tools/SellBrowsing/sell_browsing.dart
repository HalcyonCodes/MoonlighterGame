import 'package:flutter/material.dart';
import 'package:moonlighter/HomePage/Model/ViewModel/ToolViewModel/sell_browsing_view_model.dart';
import '../../../../Config/index.dart';
import '../../../../PublicWidgets/ToolTitle/title_tool.dart';
import './future_list_expansion_retainer_item.dart';
import '../../Util/util_tools.dart';
import '../../Util/util_picker.dart';

class SellBrowsing extends StatelessWidget {
  final ToolUtil toolUtil;
  final PickerUtil pickerUtil;
  final SellBrowsingToolViewModel viewModel = SellBrowsingToolViewModel();

  SellBrowsing({super.key, required this.toolUtil, required this.pickerUtil,});

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
