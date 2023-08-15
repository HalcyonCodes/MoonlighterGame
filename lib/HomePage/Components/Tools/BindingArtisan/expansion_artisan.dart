import 'package:flutter/material.dart';
import 'package:whip_sword/whip_sword.dart';
import '../../Util/util_tools.dart';
import './card_head.dart';
import './card_body.dart';
import './user_expansion_head.dart';

//整个角色雇员折叠部件
class ExpansionRetainer extends StatefulWidget {
  final String? roleChannel;
  final String? roleName;
  final String? roleId;
  final ToolUtil util;
  final Function? headTap;

  const ExpansionRetainer({
    super.key,
    required this.roleId,
    required this.roleName,
    required this.roleChannel,
    required this.util,
    required this.headTap,
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
      return RetainerCard(
        retainerName: names[index],
        lastUseDate: '2023/8/7',
        id: 'A-1230-B-1234',
        profile: '第1个角色第1个雇员',
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


  void refreshUi(){
    setState(() {
      
    });
  }
}
