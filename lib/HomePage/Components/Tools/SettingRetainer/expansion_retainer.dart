import 'package:flutter/material.dart';
import 'package:moonlighter/HomePage/Components/Tools/SettingRetainer/uesr_expansion_head.dart';
import 'card_retainer.dart';
import 'package:whip_sword/whip_sword.dart';
import '../../Util/util_tools.dart';
import '../../../Model/FromJsonModel/ToolFromJsonModel/setting_retainer_from_json_model.dart';
import '../../../Model/ViewModel/ToolViewModel/setting_retainer_view_model.dart';
import '../../../Model/FromJsonModel/PickerFromJsonModel/setting_retainer_from_json_model.dart';
import '../../Util/util_picker.dart';

//整个角色雇员折叠部件
class ExpansionRetainer extends StatefulWidget {
  final String? roleChannel;
  final String? roleName;
  final String? roleId;
  final ToolUtil util;
  final Function? headTap;
  final Role role;
  final SettingRetainerViewModel? viewModel;
  final PickerUtil pickerUtil;

  const ExpansionRetainer(
      {super.key,
      required this.roleId,
      required this.roleName,
      required this.roleChannel,
      required this.util,
      required this.headTap,
      required this.role,
      required this.viewModel,
      required this.pickerUtil,
      });

  @override
  State<ExpansionRetainer> createState() => _ExpansionRetainerState();
}

class _ExpansionRetainerState extends State<ExpansionRetainer> {
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

    //注册
    //widget.util.setFuncRefreshBodyHeight(refreshBodyHeight);
    widget.util.addListFuncInsertRetainer(insertRetainer);
  }

  @override
  Widget build(BuildContext context) {
    buildItems();
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
      userHead: UserExpansionHead(
        onTap: widget.headTap,
        util: util,
        channelName: channelName,
        roleName: roleName,
        roleId: roleId,
        toolUtil: widget.util,
      ),
      util: util,
    );
  }

  void onUpTap(int index) {
    if (index != 0) {
      widget.viewModel!.moveUpRetainer(widget.role, index);
      refreshUi();
    }
  }

  void onDownTap(int index) {
    if (index != listItems!.length - 1) {
      widget.viewModel!.moveDownRetainer(widget.role, index);
      refreshUi();
    }
  }

  void onRemoveTap(int index) async {
    //将移除的插入picker里
    PickerRetainer pRetainer = PickerRetainer();
    pRetainer.retainerId = widget.role.retainers![index].retainerId;
    pRetainer.retainerName = widget.role.retainers![index].retainerName;
    pRetainer.lastDispatchTime = widget.role.retainers![index].lastDispatchTime;
    pRetainer.retainerDesc = widget.role.retainers![index].retainerDesc;

    widget.viewModel!.removeRetainer(widget.role, index);
    //buildItems();
    refreshUi();

    await refreshBodyHeight().then((v) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          refreshUi();

          //将移除的插入picker里
          widget.pickerUtil.insertRetainer!(pRetainer);
        });
      });
    });
  }

  void refreshUi() {
    setState(() {});
  }

  Future<void> refreshBodyHeight() async {
    await util!.refreshBodyHeight!();
  }

  void buildItems() {
    listItems = List.generate(widget.role.retainers!.length, (index) {
      return RetainerCard(
        retainerName: widget.role.retainers![index].retainerName,
        lastUseDate: widget.role.retainers![index].lastDispatchTime,
        id: widget.role.retainers![index].retainerId,
        profile: widget.role.retainers![index].retainerDesc,
        downOnTap: () {
          onDownTap(index);
        },
        upOnTap: () {
          onUpTap(index);
        },
        removeOnTap: () {
          onRemoveTap(index);
        },
      );
    });
  }

  void insertRetainer(Retainer retainer) async {
    widget.viewModel!.insertRetainer(widget.role, retainer);
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
    widget.util.removeListFuncInsertRetainer(insertRetainer);
  }
}
