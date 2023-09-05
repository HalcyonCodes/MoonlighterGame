import 'package:flutter/material.dart';
import '../../../../Config/index.dart';
import '../../../../PublicWidgets/CommitTitle/commit_title.dart';
import './list_expansion_retainer.dart';
import '../../Util/util_tools.dart';

class SettingRetainer extends StatelessWidget {
  final ToolUtil toolUtil;

  const SettingRetainer({super.key, required this.toolUtil});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        CommitTitle(
            iconPath: 'Svg/retainer_tool.svg', title: KString.settingRetainer, cancel: cancel, commit: commit,),
        const SizedBox(
          height: 16,
        ),
        RetainerList(
          toolUtil: toolUtil,
        )
      ],
    );
  }


  void commit(){

  }

  void cancel(){
    
  }
}
