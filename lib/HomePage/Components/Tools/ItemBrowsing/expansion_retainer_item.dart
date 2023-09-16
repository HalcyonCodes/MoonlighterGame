import 'package:flutter/material.dart';
import 'card_retainer_item.dart';
import 'package:whip_sword/whip_sword.dart';
import '../../Util/util_tools.dart';
import './uesr_expansion_head_item.dart';
import '../../../Model/FromJsonModel/ToolFromJsonModel/item_browsing_from_json_model.dart';
import '../../Util/util_picker.dart';
import '../../../Model/ViewModel/ToolViewModel/item_browsing_view_model.dart';

//角色-雇员手风琴单元
class ItemExpansionRetainer extends StatefulWidget {
  final String? roleChannel;
  final String? roleName;
  final String? roleId;
  final ToolUtil toolUtil;
  final PickerUtil pickerUtil;
  final Function? headTap;
  final Role role;
  final ItemBrowsingToolViewModel? viewModel;

  const ItemExpansionRetainer(
      {super.key,
      required this.roleId,
      required this.roleName,
      required this.roleChannel,
      required this.toolUtil,
      required this.pickerUtil,
      required this.headTap,
      required this.role,
      required this.viewModel
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

  @override
  void initState() {
    super.initState();
    isExpande = true;
    roleName = widget.roleName;
    roleId = widget.roleId;
    channelName = widget.roleChannel;
    listItems = [];
  }

  @override
  Widget build(BuildContext context) {
    listItems = List.generate(widget.role.retainers!.length, (index) {
      return ItemRetainerCard(
        retainerName: widget.role.retainers![index].retainerName,
        itemUpdate: widget.role.retainers![index].lastDispatchTime,
        id: widget.role.retainers![index].retainerId,
        profile: widget.role.retainers![index].retainerDesc,
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
            widget.toolUtil.listFuncSetItemBrowsingRetainerCardSelected!
                    .length -
                1;
        i++) {
      widget.toolUtil.listFuncSetItemBrowsingRetainerCardSelected![i](false);
    }
    //widget.toolUtil.listFuncSetItemBrowsingRetainerCardSelected![index](true);
    widget.toolUtil
        .setCurrentRetainerId(widget.role.retainers![index].retainerId);
    //widget.toolUtil.refreshPickerItemBrowsingFuture!();

    for (int i = 0;
        i <= widget.toolUtil.listFuncSetItemBrowsingSelected!.length - 1;
        i++) {
      widget.toolUtil.listFuncSetItemBrowsingSelected![i](false);
    }

    int headIndex =
        widget.viewModel!.itemBrowsingToolModel!.data!.roles!.indexWhere((element) { return element == widget.role;});

    widget.toolUtil.listFuncSetItemBrowsingSelected![headIndex](true);

    widget.pickerUtil.changePickerCurrentIndex!(8);
  }

  void refreshUi() {
    setState(() {});
  }
}
