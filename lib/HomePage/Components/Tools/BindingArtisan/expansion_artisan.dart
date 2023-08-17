import 'package:flutter/material.dart';
import 'package:whip_sword/whip_sword.dart';
import '../../Util/util_tools.dart';
import './card_body.dart';
import './user_expansion_head.dart';

//整个角色雇员折叠部件
class ExpansionArtisan extends StatefulWidget {
  final String? roleChannel;
  final String? roleName;
  final String? roleId;
  final ToolUtil util;
  final Function? headTap;

  const ExpansionArtisan({
    super.key,
    required this.roleId,
    required this.roleName,
    required this.roleChannel,
    required this.util,
    required this.headTap,
  });

  @override
  State<ExpansionArtisan> createState() => _ExpansionArtisanState();
}

class _ExpansionArtisanState extends State<ExpansionArtisan> {
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
      return BodyCard(
        key: UniqueKey(),
        retainerId: '123',
        retainerName: '沼泽小鳄',
        artisanChannel: '紫水栈桥',
        artisanId: 'A-2-2023-01-01',
        artisanName: '亚啊呐',
        artisanProfile: '1号雇员',
        onTap: (){onTap(index);},
        util: widget.util,
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


 

  void onTap(int index) {
    for(int i = 0 ; i <= widget.util.listFuncBidingArtisanBodySelected!.length - 1 ; i ++){
      widget.util.listFuncBidingArtisanBodySelected![i](false);
    }

    //添加viewmodel删除工匠逻辑
  }


  void refreshUi(){
    setState(() {
      
    });
  }
}
