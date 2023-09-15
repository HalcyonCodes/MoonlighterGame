import 'package:flutter/material.dart';
import 'package:whip_sword/whip_sword.dart';
import '../../Util/util_tools.dart';
import './card_body.dart';
import './user_expansion_head.dart';
import '../../../Model/FromJsonModel/ToolFromJsonModel/binding_artisan_from_json_model.dart';
import '../../../Model/ViewModel/ToolViewModel/binding_artisan_view_model.dart';

//整个角色雇员折叠部件
class ExpansionArtisan extends StatefulWidget {
  final String? roleChannel;
  final String? roleName;
  final String? roleId;
  final ToolUtil util;
  final Function? headTap;

  final Role? role;
  final BindingArtisanToolViewModel? viewModel;

  const ExpansionArtisan({
    super.key,
    required this.roleId,
    required this.roleName,
    required this.roleChannel,
    required this.util,
    required this.headTap,
    required this.role,
    required this.viewModel,
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

  @override
  void initState() {
    super.initState();
    isExpande = true;
    roleName = widget.roleName;
    roleId = widget.roleId;
    channelName = widget.roleChannel;

    //注册
    widget.util.addListFuncInsertArtisan(insertArtisan);
  }

  @override
  Widget build(BuildContext context) {
    listItems = List.generate(widget.role!.retainers.length, (index) {
      return BodyCard(
        key: UniqueKey(),
        retainerId: widget.role!.retainers[index].retainerId,
        retainerName: widget.role!.retainers[index].retainerName,
        artisanChannel: widget.role!.retainers[index].artisan.artisanChannel,
        artisanId: widget.role!.retainers[index].artisan.artisanId,
        artisanName: widget.role!.retainers[index].artisan.artisanName,
        artisanProfile: widget.role!.retainers[index].artisan.artisanDesc,
        bodyOnTap: () {
          bodyOnTap(index);
        },
        removeOnTap: () {
          removeOnTap(index);
        },
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

  void bodyOnTap(int index) {
    for (int i = 0;
        i <= widget.util.listFuncBidingArtisanBodySelected!.length - 1;
        i++) {
      widget.util.listFuncBidingArtisanBodySelected![i](false);
    }
    widget.util.setCurrentRetainerId(widget.role!.retainers[index].retainerId);
    //获取role所在的index
    int roleIndex = widget.viewModel!.bindingArtisanToolModel!.data.roles
        .indexWhere((element) => element == widget.role);
    widget.util.setCurrentRoleIndex(roleIndex);

    //设置head选中状态
    for (int i = 0;
        i <= widget.util.listFuncBidingArtisanHeadSelected!.length - 1;
        i++) {
      widget.util.listFuncBidingArtisanHeadSelected![i](false);
    }
    widget.util.listFuncBidingArtisanHeadSelected![roleIndex](true);
  }

  void removeOnTap(int index) async {
    widget.viewModel!.removeArtisan(widget.role!.retainers[index]);

    refreshUi();
    await refreshBodyHeight().then((v) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          refreshUi();
        });
      });
    });
  }

  Future<void> refreshBodyHeight() async {
    await util!.refreshBodyHeight!();
  }

  void refreshUi() {
    setState(() {});
  }

  void insertArtisan(Artisan artisan) async {
    //Retainer retainer = widget.role!.retainers.where((element) {
    //  return element.retainerId == widget.util.currentRetainerId!;
    // }).first;
    if(widget.util.currentRetainerId != null){
      bool isExpanded = false;
    
    Retainer? retainer = widget.role!.retainers.firstWhere(
      (element) => element.retainerId == widget.util.currentRetainerId!,
      orElse: () {
        isExpanded = true;
        return widget.role!.retainers.first;
      }, 
    );

     
    if (retainer.artisan.artisanId == '' && isExpanded == false) {
      widget.viewModel!.insertArtisan(retainer, artisan);
      refreshUi();
      await refreshBodyHeight().then((v) {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            refreshUi();
          });
        });
      });
    }

    }
    
  }

  @override
  void dispose() {
    super.dispose();
    widget.util.removeListFuncInsertArtisan(insertArtisan);
  }
}
