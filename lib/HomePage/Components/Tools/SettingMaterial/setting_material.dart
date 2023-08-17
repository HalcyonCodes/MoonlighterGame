import 'package:flutter/material.dart';
import '../../../../Config/index.dart';
import '../../../../PublicWidgets/ToolTitle/title_tool.dart';
import './list_expansion_retainer_item.dart';
import '../../Util/util_tools.dart';

class SettingMaterial extends StatelessWidget {
  final ToolUtil toolUtil;

  const SettingMaterial({super.key, required this.toolUtil});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        ToolTitle(
            iconPath: 'Svg/item_tool.svg', name: KString.roleRetainer),
        const SizedBox(
          height: 16,
        ),
        ItemRetainerList(
          toolUtil: toolUtil,
        )
      ],
    );
  }
}
