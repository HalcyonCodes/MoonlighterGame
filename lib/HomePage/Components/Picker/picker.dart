import 'package:flutter/material.dart';
import './SettingTag/setting_tag.dart';
import './SettingRobot/future_setting_robot.dart';
import './SettingRole/setting_role.dart';
import './SettingRetainer/setting_retainer.dart';
import './ItemBrowsing/item_browsing.dart';
import './BindingArtisan/binding_artisan.dart';
import './SettingShelf/setting_shelf.dart';
import './SettingMaterial/setting_material.dart';
import './SettingCompany/setting_company.dart';
import './SellBrowsing/sell_browsing.dart';
import './OrderManager/order_manager.dart';

import '../Util/util_picker.dart';
import '../Util/util_tools.dart';

class Picker extends StatefulWidget {
  final PickerUtil pickerUtil;
  final ToolUtil toolUtil;

  const Picker({super.key, required this.pickerUtil, required this.toolUtil});

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
          currentIndex == 2 && widget.toolUtil.listSelectId != null
              ? PickerSettingTag(pickerUtil: widget.pickerUtil, toolUtil: widget.toolUtil,)
              : currentIndex == 3 && widget.toolUtil.listSelectId != null
                  ? PickerSettingRobotFuture(toolUtil: widget.toolUtil,)
                  : currentIndex == 4 && widget.toolUtil.listSelectId != null
                      ? SizedBox()
                      : currentIndex == 5 && widget.toolUtil.listSelectId != null
                          ? PickerSettingRole()
                          : currentIndex == 6 && widget.toolUtil.listSelectId != null
                              ? PickerSettingRetainer()
                              : currentIndex == 7 && widget.toolUtil.listSelectId != null
                                  ? PickerOrderManager()
                                  : currentIndex == 8 && widget.toolUtil.listSelectId != null
                                      ? PickerItemBrowsing()
                                      : currentIndex == 9 && widget.toolUtil.listSelectId != null
                                          ? PickerBindingArtisan()
                                          : currentIndex == 10 && widget.toolUtil.listSelectId != null
                                              ? PickerSettingShelf(
                                                  pickerUtil: widget.pickerUtil,
                                                )
                                              : currentIndex == 11 && widget.toolUtil.listSelectId != null
                                                  ? PickerSellBrowsing(
                                                      pickerUtil:
                                                          widget.pickerUtil,
                                                    )
                                                  : currentIndex == 12 && widget.toolUtil.listSelectId != null
                                                      ? PickerSettingMaterial(
                                                          pickerUtil:
                                                              widget.pickerUtil,
                                                        )
                                                      : currentIndex == 13 && widget.toolUtil.listSelectId != null
                                                          ? PickerSettingCompany()
                                                          : SizedBox()
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
