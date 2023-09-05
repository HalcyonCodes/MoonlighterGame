import 'package:flutter/material.dart';
import '../../../../Config/index.dart';
import '../../../../PublicWidgets/CommitTitle/commit_title.dart';
import './card_robot.dart';

class SettingRobot extends StatelessWidget {
  const SettingRobot({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          CommitTitle(
              iconPath: 'Svg/robot_tool.svg', title: KString.settingRobot, cancel: cancel, commit: commit,),
          const SizedBox(
            height: 16,
          ),
          RobotCard(
              id: 'RO001',
              date: '2024/7/20',
              name: '雇员机器人01',
              profile: '第1个机器人',
              bindingCount: '203',
              scripCount: '301',
              onTap: () {})
        ],
      ),
    );
  }


  void commit(){

  }

  void cancel(){
    
  }
}
