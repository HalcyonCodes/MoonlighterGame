import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../Config/index.dart';
import '../../Util/util_tools.dart';

//折叠部件的头部
class ItemExpansionChannel extends StatefulWidget {
  final String? channelName;
  final String? channelId;
  final String? memberCount;
  final Animation<double> animation;
  final bool? isSelect;
  final ToolUtil toolUtil;

  const ItemExpansionChannel({
    super.key,
    required this.channelName,
    required this.channelId,
    required this.memberCount,
    required this.animation,
    required this.isSelect,
    required this.toolUtil,
  });

  @override
  State<ItemExpansionChannel> createState() => _ItemExpansionChannelState();
}

class _ItemExpansionChannelState extends State<ItemExpansionChannel> {
  bool? isSelect;
  String? channelName;
  String? channelId;
  String? memberCount;

  @override
  void initState() {
    super.initState();
    isSelect = widget.isSelect;

    channelName = widget.channelName;
    channelId = widget.channelId;
    memberCount = widget.memberCount;

    widget.toolUtil.addListFuncSettingRoleHeadSelected(setIsSelect);
    widget.toolUtil.addListFuncChangeMemberCount(changeCount);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.animation,
      builder: (context, child) {
        return Container(
          height: 46,
          width: MediaQuery.of(context).size.width <= 1920
              ? ((1920 - 24) / 24 * 7) - 24 - 24
              : ((1920 - 24) / 24 * 7) - 24 - 24,
          decoration: isSelect == true
              ? KDecoration.cardSelectedDecoration
              : KDecoration.cardDecoration,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Transform.rotate(
                  angle: widget.animation.value * pi,
                  child: SizedBox(
                    height: 22,
                    width: 22,
                    child: SvgPicture.asset(
                      'Svg/angle_down_tool.svg',
                      color: isSelect == true ? Colors.white : Colors.black,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    '$channelName : ${memberCount!} / 8',
                    style: isSelect == true
                        ? KFont.expansionHeadSelectedStyle
                        : KFont.expansionHeadUnSelectStyle,
                    strutStyle: const StrutStyle(leading: 0),
                  ),
                ),
                const Expanded(child: SizedBox()),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    channelId!,
                    style: isSelect == true
                        ? KFont.expansionHeadSelectedStyle
                        : KFont.expansionHeadUnSelectStyle,
                    strutStyle: const StrutStyle(leading: 0),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void setIsSelect(bool b) {
    isSelect = b;
    refreshUi();
  }

  void refreshUi() {
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    widget.toolUtil.removeListFuncSettingRoleHeadSelected(setIsSelect);
    widget.toolUtil.removeListFuncChangeMemberCount(changeCount);
  }

  void changeCount(bool isAdd) {
    isAdd == true
        ? memberCount = (int.parse(memberCount!) + 1).toString()
        : memberCount = (int.parse(memberCount!) - 1).toString();
    refreshUi();
  }
}
