import 'package:flutter/material.dart';
import '../../../../Config/index.dart';
import '../../Util/util_tools.dart';

//每个雇员卡片
class ItemRetainerCard extends StatefulWidget {
  final String? retainerName;
  final String? itemUpdate;
  final String? id;
  final String? profile;
  final ToolUtil? toolUtil;
  final Function()? onTap;

  const ItemRetainerCard({
    super.key,
    required this.retainerName,
    required this.itemUpdate,
    required this.id,
    required this.profile,
    required this.toolUtil,
    required this.onTap,
  });

  @override
  State<ItemRetainerCard> createState() => _ItemRetainerCardState();
}

class _ItemRetainerCardState extends State<ItemRetainerCard> {
  String? id;
  String? retainerName;
  String? itemUpdate;
  String? profile;
  bool? isSelect;

  @override
  void initState() {
    super.initState();

    id = widget.id;
    retainerName = widget.retainerName;
    itemUpdate = widget.itemUpdate;
    profile = widget.profile;
    isSelect = false;

    //注册
    widget.toolUtil!.addListFuncSellBrowsingBodySelected(setIsSelect);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      width: MediaQuery.of(context).size.width <= 1920
          ? ((1920 - 24) / 24 * 7) - 24 - 24 - 24
          : ((1920 - 24) / 24 * 7) - 24 - 24 - 24,
      height: 115,
      decoration: isSelect == true
          ? KDecoration.cardSelectedDecoration
          : KDecoration.cardDecoration,
      child: InkWell(
        onTap: () {
          widget.onTap!();
          setIsSelect(true);
        },
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      id!,
                      style: isSelect == true
                          ? KFont.cardProfileSelectedStyle
                          : KFont.cardProfileStyle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Expanded(child: SizedBox()),
                    Text(
                      '更新时间： ${itemUpdate!}',
                      style: isSelect == true
                          ? KFont.cardProfileSelectedStyle
                          : KFont.cardProfileStyle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 54,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              retainerName!,
                              style: isSelect == true
                                  ? KFont.cardTitleSelectedStyle
                                  : KFont.cardTitleStyle,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Text(
                              profile!,
                              style: isSelect == true
                                  ? KFont.cardProfileSelectedStyle
                                  : KFont.cardProfileStyle,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                    ]),
              ]),
        ),
      ),
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

    widget.toolUtil!.removeListFuncSellBrowsingBodySelected(setIsSelect);
  }
}
