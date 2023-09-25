import 'package:flutter/material.dart';
import 'package:whip_sword/head_animated_interface.dart';
import 'package:whip_sword/util.dart';

import '../../Util/util_tools.dart';

import './expansion_item_channel.dart';

//Uesr所要实现的Head内容
class ItemUserExpansionHead extends StatefulWidget {
  final String? channelName;
  final String? menberCount;
  final String? channelId;
  final Util? util;
  final Function? onTap;

  final ToolUtil toolUtil;

  const ItemUserExpansionHead({
    super.key,
    required this.util,
    required this.channelName,
    required this.channelId,
    required this.menberCount,
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
  String? channelId;
  String? memberCount;

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
    channelId = widget.channelId;
    memberCount = widget.menberCount;
  }

  @override
  Widget build(BuildContext context) {
    return HeadAnimatedInterface(
      animationController: controller!,
      animation: animation!,
      util: widget.util!,
      onTap: widget.onTap!,
      child: ItemExpansionChannel(
        animation: animation!,
        channelName: channelName,
        channelId: channelId,
        memberCount: memberCount,
        isSelect: false, 
        toolUtil: widget.toolUtil,
      ),
    );
  }
}
