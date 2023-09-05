import 'package:flutter/material.dart';
import '../../../../PublicWidgets/CommitTitle/commit_title.dart';
import '../../../../Config/index.dart';
import './role_list.dart';

class SettingRole extends StatelessWidget {
  final String? roleCount;
  const SettingRole({super.key, required this.roleCount});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width <= 1920 ?
          (1920 - 24)/24 * 7 - 24 :
          (1920 - 24)/24 * 7 - 24,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          CommitTitle(iconPath: 'Svg/role_tool.svg', title: '${KString.settingRole}  ${roleCount!} / 8' , commit: commit, cancel: cancel,),
          const SizedBox(height: 16,),
          RoleList(),
        ],
      ),
    );
  }


  void commit(){

  }

  void cancel(){
    
  }
}