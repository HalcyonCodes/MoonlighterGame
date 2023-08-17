import 'package:flutter/material.dart';
import 'package:whip_sword/head_animated_interface.dart';
import 'package:whip_sword/util.dart';
import './expansion_card_role_item.dart';
import '../../Util/util_tools.dart';

//Uesr所要实现的Head内容
class ItemUserExpansionHead extends StatefulWidget {
  final String? channelName;
  final String? roleName;
  final String? roleId;
  final Util? util;
  final Function? onTap;

  final ToolUtil toolUtil;

  const ItemUserExpansionHead({
    super.key,
    required this.util,
    required this.channelName,
    required this.roleName,
    required this.roleId,
    required this.toolUtil,
    required this.onTap,
  });

  @override
  State<ItemUserExpansionHead> createState() => _ItemUserExpansionHeadState();
}

class _ItemUserExpansionHeadState extends State<ItemUserExpansionHead>
    with TickerProviderStateMixin {
  AnimationController? controller;
  Animation<double>? animation;

  String? channelName;
  String? roleName;
  String? roleId;

  @override
  void initState() {
    super.initState();
    //实现动画控制器
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    animation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: controller!,
        curve: const Interval(0, 1.0, curve: Curves.fastOutSlowIn)));

    //初始化
    channelName = widget.channelName;
    roleName = widget.roleName;
    roleId = widget.roleId;
  }

  @override
  Widget build(BuildContext context) {
    return HeadAnimatedInterface(
      animationController: controller!,
      animation: animation!,
      util: widget.util!,
      onTap: widget.onTap!,
      child: ItemExpansionRoleCard(
        animation: animation!,
        channelName: channelName,
        roleName: roleName,
        roleId: roleId,
        util: widget.toolUtil,
        isSelect: false,
      ),
    );
  }
}
