import 'package:flutter/material.dart';
import '../../../../ToolWidgets/rectangle_cliper.dart';
import 'robot_card_picker.dart';
import '../../../Model/ViewModel/PickerViewModel/setting_robot_view_model.dart';
import '../../Util/util_tools.dart';

class PickerRobotCardList extends StatefulWidget {
  final ToolUtil toolUtil;
  final SettingRobotPickerViewModel viewModel;

  const PickerRobotCardList(
      {super.key, required this.toolUtil, required this.viewModel});

  @override
  State<PickerRobotCardList> createState() => _PickerRobotCardListState();
}

class _PickerRobotCardListState extends State<PickerRobotCardList> {
  List<Widget>? items;

  @override
  void initState() {
    super.initState();
    items = [];
  }

  @override
  Widget build(BuildContext context) {
    items = List.generate(6, (index) {
      return PickerRobotCard(
          id: widget
              .viewModel.settingRobotPickerModel!.data.robots![index].robotId,
          date: widget.viewModel.settingRobotPickerModel!.data.robots![index]
              .robotCreateDate,
          name: widget
              .viewModel.settingRobotPickerModel!.data.robots![index].robotName,
          profile: widget.viewModel.settingRobotPickerModel!.data.robots![index]
              .robotProfile,
          bindingCount: widget.viewModel.settingRobotPickerModel!.data
              .robots![index].bidingCount,
          scripCount: widget.viewModel.settingRobotPickerModel!.data
              .robots![index].scriptCount,
          onTap: () {
            onCardTap(index);
          });
    });

    return ClipPath(
      clipper: RectangleClipper(),
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: ListView(
          clipBehavior: Clip.none,
          children: items!,
        ),
      ),
    );
  }

  void onCardTap(int index) {
    widget.toolUtil.addViewModelRobot!(
        widget.viewModel.settingRobotPickerModel!.data.robots![index]);
  }
}
