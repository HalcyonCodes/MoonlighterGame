import 'package:flutter/material.dart';
import '../../../../ToolWidgets/rectangle_cliper.dart';
import 'robot_card_picker.dart';

class PickerRobotCardList extends StatefulWidget {
  const PickerRobotCardList({super.key});

  @override
  State<PickerRobotCardList> createState() => _PickerRobotCardListState();
}

class _PickerRobotCardListState extends State<PickerRobotCardList> {
  List<Widget>? items;

  @override
  void initState() {
    super.initState();

    items = List.generate(6, (index) {
      return PickerRobotCard(
          id: 'id',
          date: 'date',
          name: 'name',
          profile: 'profile',
          bindingCount: 'bindingCount',
          scripCount: 'scripCount',
          onTap: () {
            onCardTap(index);
          });
    });
  }

  @override
  Widget build(BuildContext context) {
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

  void onCardTap(int index) {}
}
