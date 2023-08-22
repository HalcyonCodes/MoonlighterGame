import 'package:flutter/material.dart';
import '../../../../ToolWidgets/rectangle_cliper.dart';
import './retainer_card_picker.dart';

class PickerRetainerList extends StatefulWidget {
  const PickerRetainerList({super.key});

  @override
  State<PickerRetainerList> createState() => _PickerRetainerListState();
}

class _PickerRetainerListState extends State<PickerRetainerList> {
  List<Widget>? items;

  @override
  void initState() {
    super.initState();
    items = List.generate(7, (index) {
      return PickerRetainerCard(
          retainerName: 'retainerName',
          lastUseDate: 'lastUseDate',
          id: '123',
          profile: 'profile',
          addOnTap: () {},
          closeOnTap: () {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 24 - 24 - 46 - 16 - 217 - 32,
      child: ClipPath(
        clipper: RectangleClipper(),
        child: ScrollConfiguration(
            behavior:
                ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: ListView(
              clipBehavior: Clip.none,
              children: items!,
            )),
      ),
    );
  }
}
