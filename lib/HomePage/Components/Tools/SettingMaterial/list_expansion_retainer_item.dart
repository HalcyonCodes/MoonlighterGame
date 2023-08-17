import 'package:flutter/material.dart';
import '../../../../ToolWidgets/rectangle_cliper.dart';
import 'expansion_retainer_item.dart';
import '../../Util/util_tools.dart';

//包裹所有角色-雇员手风琴的列表
class ItemRetainerList extends StatefulWidget {
  final ToolUtil toolUtil;

  const ItemRetainerList({super.key, required this.toolUtil});

  @override
  State<ItemRetainerList> createState() => _ItemRetainerListState();
}

class _ItemRetainerListState extends State<ItemRetainerList> {
  List<ItemExpansionRetainer>? items;

  @override
  void initState() {
    super.initState();
    //初始化
    widget.toolUtil.setListFuncSetItemBrowsingSelected([]);
    widget.toolUtil.setListFuncSetItemBrowsingRetainerCardSelected([]);
    //widget.toolUtil.setListFuncInitExpansionRoleCardSelected([]);
  }

  @override
  Widget build(BuildContext context) {
    //初始化数据的地方
    items = List.generate(64, (index) {
      return ItemExpansionRetainer(
        roleId: 'A-333-222-111',
        roleName: '沼泽小鳄',
        roleChannel: '静语庄园',
        toolUtil: widget.toolUtil,
        headTap: () {
          onTap(index);
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

  void onTap(index) {
    //print(widget.toolUtil.listFuncSetItemBrowsingSelected!.length);
    for (int i = 0;
        i <= widget.toolUtil.listFuncSetItemBrowsingSelected!.length - 1;
        i++) {
      widget.toolUtil.listFuncSetItemBrowsingSelected![i](false);
    }
    widget.toolUtil.listFuncSetItemBrowsingSelected![index](true);
  }
}
