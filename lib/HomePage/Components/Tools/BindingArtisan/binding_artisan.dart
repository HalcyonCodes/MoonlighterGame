import 'package:flutter/material.dart';
import '../../Util/util_tools.dart';
import '../../../../PublicWidgets/CommitTitle/commit_title.dart';
import '../../../../Config/index.dart';
import './list_expansion.dart';

class BindingArtisan extends StatelessWidget {
  final ToolUtil util;
  const BindingArtisan({super.key , required this.util});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        CommitTitle(iconPath: 'Svg/artisan_tool.svg', title: KString.settingArtisan),
        const SizedBox(height: 16,),
        ExpansionList(util: util,)

      ],
    );
  }
}
