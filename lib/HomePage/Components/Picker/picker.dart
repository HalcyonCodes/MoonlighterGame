import 'package:flutter/material.dart';
import './SettingTag/setting_tag.dart';
import './SettingRobot/setting_robot.dart';
import './SettingRole/setting_role.dart';
import './SettingRetainer/setting_retainer.dart';

import '../Util/util_picker.dart';

class Picker extends StatefulWidget {
  final PickerUtil pickerUtil;

  const Picker({super.key, required this.pickerUtil});

  @override
  State<Picker> createState() => _PickerState();
}

class _PickerState extends State<Picker> {
  int? currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = 0;
    widget.pickerUtil.setFuncChangePickerCurrentIndex(changePickIndex);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width <= 1920
          ? (1920 - 24) / 24 * 8 - 24
          : (1920 - 24) / 24 * 8 - 24,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          currentIndex == 2 ? PickerSettingTag() : 
          currentIndex == 3 ? PickerSettingRobot() :
          currentIndex == 4 ? SizedBox() :
          currentIndex == 5 ? PickerSettingRole() :
          currentIndex == 6 ? PickerSettingRetainer() :
          SizedBox()
        ],
      ),
    );
  }

  void refreshUi() {
    setState(() {});
  }

  void changePickIndex(int index) {
    currentIndex = index;
    refreshUi();
  }
}
