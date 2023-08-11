import 'package:flutter/material.dart';
import '../../../../ToolWidgets/rectangle_cliper.dart';
import './expansion_retainer.dart';
import '../../Util/util_tools.dart';

class RetainerList extends StatefulWidget {
  final ToolUtil toolUtil;

  const RetainerList({super.key, required this.toolUtil});

  @override
  State<RetainerList> createState() => _RetainerListState();
}

class _RetainerListState extends State<RetainerList> {
  List<ExpansionRetainer>? items;

  @override
  void initState() {
    super.initState();
    //初始化
    widget.toolUtil.setListFuncSetExpansionRoleCardSelected([]);
    //widget.toolUtil.setListFuncInitExpansionRoleCardSelected([]);
  }

  @override
  Widget build(BuildContext context) {
    //初始化数据的地方
    items = List.generate(64, (index) {
      return ExpansionRetainer(
        roleId: 'A-333-222-111',
        roleName: '沼泽小鳄',
        roleChannel: '静语庄园',
        util: widget.toolUtil,
        headTap: () {
          ontap(index);
        },
      );
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
          child: SingleChildScrollView(
            clipBehavior: Clip.none,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: items!,
            ),
          ),
        ),
      ),
    );
  }

  void ontap(index) {
    for (int i = 0;
        i <= widget.toolUtil.listFuncSetExpansionRoleCardSelected!.length - 1;
        i++) {
      widget.toolUtil.listFuncSetExpansionRoleCardSelected![i](false);
    }
    widget.toolUtil.listFuncSetExpansionRoleCardSelected![index](true);
  }

}
