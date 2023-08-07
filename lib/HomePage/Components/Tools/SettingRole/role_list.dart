import 'package:flutter/material.dart';
import '../../../../ToolWidgets/rectangle_cliper.dart';
import './role_card.dart';

class RoleList extends StatefulWidget {
  const RoleList({super.key});

  @override
  State<RoleList> createState() => _RoleListState();
}

class _RoleListState extends State<RoleList> {
  List<String>? names = [
    '111',
    '222',
    '333',
    '444',
    '555',
    '666',
    '777',
    '888'
  ];

  List<Widget>? listItems;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    listItems = List.generate(names!.length, (index) {
      return RoleCard(
          id: 'A1234',
          category: '雇员',
          name: names![index],
          profile: '卖东西的',
          downOnTap: () {
            onDownTap(index);
          },
          upOnTap: () {
            onUpTap(index);
          },
          removeOnTap: () {
            onRemoveTap(index);
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
      child: ClipPath(
        clipper: RectangleClipper(),
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: ListView(
            clipBehavior: Clip.none,
            children: listItems!,
          ),
        ),
      ),
    );
  }

  void onUpTap(int index) {
    if (index != 0) {
      Widget temp = listItems![index - 1];
      listItems![index - 1] = listItems![index];
      listItems![index] = temp;
      //test
      String stringTemp = names![index - 1];
      names![index - 1] = names![index];
      names![index] = stringTemp;

      refreshUi();
    }
  }

  void onDownTap(int index) {
    if (index != listItems!.length - 1) {
      Widget temp = listItems![index + 1];
      listItems![index + 1] = listItems![index];
      listItems![index] = temp;
      //test
      String stringTemp = names![index + 1];
      names![index + 1] = names![index];
      names![index] = stringTemp;

      refreshUi();
    }
  }

  void onRemoveTap(int index) {
    listItems!.removeAt(index);
    names!.removeAt(index);
    refreshUi();
  }

  void refreshUi() {
    setState(() {});
  }
}
