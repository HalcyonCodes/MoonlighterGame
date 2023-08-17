import 'package:flutter/material.dart';
import '../../../../Config/index.dart';
import '../../../../PublicWidgets/ToolTitle/title_tool.dart';
import './list_expansion_retainer_item.dart';
import '../../Util/util_tools.dart';

class SellBrowsing extends StatelessWidget {
  final ToolUtil toolUtil;

  const SellBrowsing({super.key, required this.toolUtil});

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
        ItemRetainerList(
          toolUtil: toolUtil,
        )
      ],
    );
  }
}
