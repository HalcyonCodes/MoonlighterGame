import 'package:flutter/material.dart';
import 'package:moonlighter/HomePage/Components/Tools/SettingTag/list_tag.dart';
import '../../../../PublicWidgets/CommitTitle/commit_title.dart';
import '../../../../Config/index.dart';

class SettingTag extends StatelessWidget {
  const SettingTag({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          CommitTitle(iconPath: 'Svg/tag_tool.svg', title: KString.settingTag),
          const SizedBox(
            height: 16,
          ),
          TagList()
        ],
      ),
    );
  }

  void commit() {}
}
