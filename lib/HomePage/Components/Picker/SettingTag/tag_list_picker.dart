import 'package:flutter/material.dart';
import 'package:moonlighter/HomePage/Components/Picker/SettingTag/tag_card_picker.dart';
import '../../.././../ToolWidgets/rectangle_cliper.dart';

class PickerTagList extends StatefulWidget {
  const PickerTagList({super.key});

  @override
  State<PickerTagList> createState() => _PickerTagListState();
}

class _PickerTagListState extends State<PickerTagList> {
  List<Widget>? items;

  @override
  void initState() {
    super.initState();
    items = List.generate(30, (index) {
      return PickerTagCard(
          name: 'test', date: '123', onDelectTap: () {}, onAddTap: () {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 24 - 24 - 46 - 16 - 83 - 32,
      child: ClipPath(
        clipper: RectangleClipper(),
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: ListView(clipBehavior: Clip.none, children: items!)),
      ),
    );
  }
}
