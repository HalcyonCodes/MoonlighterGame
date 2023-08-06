import 'package:flutter/material.dart';
import '../../../ToolWidgets/rectangle_cliper.dart';
import 'terminal_search_bar.dart';
import './terminal_card.dart';
import '../Util/util_list.dart';

class TerminalList extends StatefulWidget {
  const TerminalList({super.key});

  @override
  State<TerminalList> createState() => _TerminalListState();
}

class _TerminalListState extends State<TerminalList> {
  ListUtil? listUtil;
  List<Widget>? listItems;

  @override
  void initState() {
    super.initState();
    listUtil = ListUtil();

    listItems = List.generate(10, (index) {
      return TerminalCard(
        key: UniqueKey(),
        id: 'RO012',
        name: 'ycy13642202030',
        buildTime: '2023/8/4',
        robotCategory: '雇员机器人',
        tags: ['1号雇员', '2号雇员'],
        status: 'status',
        util: listUtil!,
      );
    });

    listUtil!.setListFuncCancelSelected([]);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 24 - 24,
      width: MediaQuery.of(context).size.width <= 1920
          ? (1920 - 24) / 24 * 7 - 24
          : (1920 - 24) / 24 * 7 - 24,
      child: ClipPath(
        clipper: RectangleClipper(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TerminalSearchBar(),
            SizedBox(
              height: 32,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height - 24 - 24 - 46 - 32,
              child: ClipPath(
                clipper: RectangleClipper(),
                child: ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context)
                      .copyWith(scrollbars: false, ),
                  child: ListView(
                    clipBehavior: Clip.none,
                    children: listItems!,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
