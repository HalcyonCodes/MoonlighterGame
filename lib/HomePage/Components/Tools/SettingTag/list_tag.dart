import 'package:flutter/material.dart';
import 'package:moonlighter/HomePage/Components/Tools/SettingTag/card_tag.dart';
import '../../../../ToolWidgets/rectangle_cliper.dart';

class TagList extends StatefulWidget {
  const TagList({super.key});

  @override
  State<TagList> createState() => _TagListState();
}

class _TagListState extends State<TagList> {
  List<Widget>? listItems;
  int? cardCount = 12;

  List<String> test = [
    't1',
    't2',
    't3',
    't4',
    't5',
    't6',
    't7',
    't8',
    't9',
    't10'
  ];

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    listItems = List.generate(test.length, (index) {
      return TagCard(
          key: UniqueKey(),
          name: test[index],
          date: '2023/8/7',
          onTap: () {
            //listItems!.removeAt(index);
            test.removeAt(index);
            refreshUi();
          });
    });
    return SizedBox(
      height: MediaQuery.of(context).size.height -
          24 -
          24 -
          46 -
          (55 + 8 + 17 + 16) * 3 -
          32 -
          46 -
          16,
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: ClipPath(
          clipper: RectangleClipper(),
          child: SingleChildScrollView(
            clipBehavior: Clip.none,
            child: Column(
              children: listItems!,
            ),
          ),
        ),
      ),
    );
  }

  void refreshUi() {
    setState(() {});
  }

  void onRemoveTap(index) {}
}
