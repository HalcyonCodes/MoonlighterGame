import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../Config/index.dart';
import '../../Util/util_tools.dart';

//折叠部件的头部
class ItemExpansionRoleCard extends StatefulWidget {
  final String? roleName;
  final String? roleId;
  final String? channelName;
  final Animation<double> animation;
  final bool? isSelect;
  final ToolUtil util;

  const ItemExpansionRoleCard({
    super.key,
    required this.channelName,
    required this.animation,
    required this.roleName,
    required this.roleId,
    required this.isSelect,
    required this.util,
  });

  @override
  State<ItemExpansionRoleCard> createState() => _ItemExpansionRoleCardState();
}

class _ItemExpansionRoleCardState extends State<ItemExpansionRoleCard> {
  bool? isSelect;

  @override
  void initState() {
    super.initState();
    isSelect = widget.isSelect;
    //注册
    widget.util.addListFuncSellBrowsingHeadSelected(setIsSelect);
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
                    '${widget.channelName}: ${widget.roleName!}',
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
                    widget.roleId!,
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

    widget.util.removeListFuncSellBrowsingHeadSelected(setIsSelect);
  }
}
