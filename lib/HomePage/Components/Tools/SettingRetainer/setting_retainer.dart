import 'package:flutter/material.dart';
import '../../../../Config/index.dart';
import '../../../../PublicWidgets/CommitTitle/commit_title.dart';
import './list_expansion_retainer.dart';

class SettingRetainer extends StatelessWidget {
  const SettingRetainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        CommitTitle(iconPath: 'Svg/retainer_tool.svg', title: KString.settingRetainer),
        const SizedBox(height: 16,),
        RetainerList()
      ],
    );
  }
}