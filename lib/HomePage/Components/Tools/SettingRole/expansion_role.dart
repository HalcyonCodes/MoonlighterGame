import 'package:flutter/material.dart';
import 'package:moonlighter/HomePage/Components/Util/util_picker.dart';

import 'package:moonlighter/HomePage/Model/FromJsonModel/ToolFromJsonModel/setting_role_from_json_model.dart';
import 'package:whip_sword/whip_sword.dart';
import '../../Util/util_tools.dart';
import './uesr_expansion_head_item.dart';

import './role_card.dart';
import '../../../Model/ViewModel/ToolViewModel/setting_role_view_model.dart';
import '../../../Model/FromJsonModel/PickerFromJsonModel/setting_role_from_json_model.dart';

//角色-雇员手风琴单元
class ExpansionRole extends StatefulWidget {
  final ToolUtil toolUtil;
  final PickerUtil pickerUtil;
  final SettingRoleToolViewModel viewModel;
  final Channel channel;

  const ExpansionRole({
    super.key,
    required this.toolUtil,
    required this.viewModel,
    required this.channel,
    required this.pickerUtil,
  });

  @override
  State<ExpansionRole> createState() => _ExpansionRoleState();
}

class _ExpansionRoleState extends State<ExpansionRole> {
  Util? util = Util();

  List<Widget>? listItems;

  bool? isExpande;

  @override
  void initState() {
    super.initState();
    isExpande = true;

    widget.toolUtil.addListFuncInsertRole(insertRole);
  }

  @override
  Widget build(BuildContext context) {
    listItems = List.generate(widget.channel.roles.length, (index) {
      return RoleCard(
        id: widget.channel.roles[index].roleId,
        category: widget.channel.roles[index].roleCategory,
        name: widget.channel.roles[index].roleName,
        profile: widget.channel.roles[index].roleDesc,
        downOnTap: () {
          onTap();
          onDownTap(index);
        },
        upOnTap: () {
          onTap();
          onUpTap(index);
        },
        removeOnTap: () {
          onTap();
          onRemoveTap(index);
        },
        onCardTap: () {
          //onTap();
          onTap();
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
        onTap: () {
          onTap();
        },
        util: util,
        channelName: widget.channel.channelName,
        channelId: widget.channel.channelId,
        menberCount: widget.channel.channelRoleCount,
        toolUtil: widget.toolUtil,
      ),
      util: util,
    );
  }

  void onTap() {
    for (int i = 0;
        i <= widget.toolUtil.listFuncSettingRoleHeadSelected!.length - 1;
        i++) {
      widget.toolUtil.listFuncSettingRoleHeadSelected![i](false);
    }

    int headIndex = widget.viewModel.settingRoleToolModel!.data.channels
        .indexWhere((element) {
      return element.channelId == widget.channel.channelId;
    });

    widget.toolUtil.listFuncSettingRoleHeadSelected![headIndex](true);
    widget.toolUtil.setCurrentChannelId(widget.channel.channelId);
    widget.toolUtil.setCurrentChannelIndex(headIndex);
  }

  void refreshUi() {
    setState(() {});
  }

  void onUpTap(int index) {
    if (index != 0) {
      widget.viewModel.switchRole(widget.channel, widget.channel.roles[index],
          widget.channel.roles[index - 1]);
      refreshUi();
    }
  }

  void onDownTap(int index) {
    if (index != listItems!.length - 1) {
      widget.viewModel.switchRole(widget.channel, widget.channel.roles[index],
          widget.channel.roles[index + 1]);
      refreshUi();
    }
  }

  void onRemoveTap(int index) async {
    PickerRole vRole = PickerRole();
    vRole.roleId = widget.channel.roles[index].roleId;
    vRole.roleName = widget.channel.roles[index].roleName;
    vRole.roleDesc = widget.channel.roles[index].roleDesc;
    vRole.roleCategory = widget.channel.roles[index].roleCategory;

    widget.pickerUtil.insertPickerRoleListRole!(vRole);
    widget.viewModel.removeRole(widget.channel, widget.channel.roles[index]);

    refreshUi();
    await refreshBodyHeight().then((v) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          refreshUi();
        });
      });
    });

    widget.toolUtil.listFuncChangeMemberCount![
        widget.toolUtil.currentChannelIndex!](false);
  }

  Future<void> refreshBodyHeight() async {
    await util!.refreshBodyHeight!();
  }

  void insertRole(Role role) async {
    widget.viewModel.insertRole(widget.channel, role);
    refreshUi();
    await refreshBodyHeight().then((v) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          refreshUi();
        });
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    widget.toolUtil.removeListFuncInsertRole(insertRole);
  }

 
}
