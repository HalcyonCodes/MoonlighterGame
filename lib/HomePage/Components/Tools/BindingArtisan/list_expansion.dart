import 'package:flutter/material.dart';
import '../../../../ToolWidgets/rectangle_cliper.dart';
import './expansion_artisan.dart';
import '../../Util/util_tools.dart';

//expansion的列表

class ExpansionList extends StatefulWidget {
  final ToolUtil util;

  const ExpansionList({super.key, required this.util});

  @override
  State<ExpansionList> createState() => _ExpansionListState();
}

class _ExpansionListState extends State<ExpansionList> {
  List<Widget>? items;

  @override
  void initState() {
    super.initState();

    //初始化
    items = List.generate(3, (index) {
      return ExpansionArtisan(
        key: UniqueKey(),
        roleChannel: '紫水栈桥',
        roleId: '123',
        roleName: '沼泽小鳄',
        util: widget.util,
        headTap: () {
          headTap(index);
        },
      );
    });

    //注册
    widget.util.setListFuncBidingArtisanHeadSelected([]);
    widget.util.setListFuncBidingArtisanBodySelected([]);
  }

  @override
  Widget build(BuildContext context) {
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
            behavior:
                ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: ListView(
              children: items!,
            ),
          )),
    );
  }

  void headTap(int index) {
    for (int i = 0;
        i <= widget.util.listFuncBidingArtisanHeadSelected!.length - 1;
        i++) {
      widget.util.listFuncBidingArtisanHeadSelected![i](false);
    }
    widget.util.listFuncBidingArtisanHeadSelected![index](true);
  }
}
