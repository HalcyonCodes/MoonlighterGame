import 'package:flutter/material.dart';
import './card_retainer_item.dart';
import 'package:whip_sword/whip_sword.dart';
import '../../Util/util_tools.dart';
import './uesr_expansion_head_item.dart';

//角色-雇员手风琴单元
class ItemExpansionRetainer extends StatefulWidget {
  final String? roleChannel;
  final String? roleName;
  final String? roleId;
  final ToolUtil toolUtil;
  final Function? headTap;

  const ItemExpansionRetainer({
    super.key,
    required this.roleId,
    required this.roleName,
    required this.roleChannel,
    required this.toolUtil,
    required this.headTap,
  });

  @override
  State<ItemExpansionRetainer> createState() => _ItemExpansionRetainerState();
}

class _ItemExpansionRetainerState extends State<ItemExpansionRetainer> {
  Util? util = Util();
  bool? isExpande;
  String? roleName;
  String? roleId;
  String? channelName;
  List<Widget>? listItems;

  //test
  List<String> names = ['111', '222', '333', '444', '555', '666', '777', '888'];

  @override
  void initState() {
    super.initState();
    isExpande = true;
    roleName = widget.roleName;
    roleId = widget.roleId;
    channelName = widget.roleChannel;
  }

  @override
  Widget build(BuildContext context) {
    listItems = List.generate(names.length, (index) {
      //widget.toolUtil.addIemRetainerCardIndex();
      return ItemRetainerCard(
        retainerName: names[index],
        itemUpdate: '2023/8/7',
        id: 'A-1230-B-1234',
        profile: '第1个角色第1个雇员',
        toolUtil: widget.toolUtil,
        onTap: () {
          onTap(index);
        },
      );
    });

    return WhipSword(
      headBorderRadius: BorderRadius.circular(16),
      crossAxisAlignment: CrossAxisAlignment.end,
      body: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: listItems!,
        ),
      ),
      headBottomMargin: 16,
      userHead: ItemUserExpansionHead(
        onTap: widget.headTap,
        util: util,
        channelName: channelName,
        roleName: roleName,
        roleId: roleId,
        toolUtil: widget.toolUtil,
      ),
      util: util,
    );
  }

  void onTap(index) {
    for (int i = 0;
        i <=
            widget.toolUtil.listFuncSettingShelfBodySelected!
                    .length -
                1;
        i++) {
      widget.toolUtil.listFuncSettingShelfBodySelected![i](false);
    }

  }

  void refreshUi() {
    setState(() {});
  }
}
