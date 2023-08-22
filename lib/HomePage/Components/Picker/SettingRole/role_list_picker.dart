import 'package:flutter/material.dart';
import '../../../../ToolWidgets/rectangle_cliper.dart';
import './role_card_picker.dart';

class PickerRoleList extends StatefulWidget {
  const PickerRoleList({super.key});

  @override
  State<PickerRoleList> createState() => _PickerRoleListState();
}

class _PickerRoleListState extends State<PickerRoleList> {
  List<Widget>? items;

  @override
  void initState() {
    super.initState();
    items = List.generate(7, (index) {
      return PickerRoleCard(
        id: 'A-2023-8-22',
        category: '雇员',
        name: '沼泽小鳄',
        profile: '第1个角色',
        addOnTap: () {},
        removeOnTap: () {},
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 24 - 24 - 359 - 16 - 46 - 32,
      child: ClipPath(
        clipper: RectangleClipper(),
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: ListView(
            clipBehavior: Clip.none,
            children: items!,
          ),
        ),
      ),
    );
  }
}
