import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moonlighter/Config/index.dart';
import '../../Util/util_tools.dart';

class BodyCard extends StatefulWidget {
  final String? retainerName;
  final String? retainerId;
  final String? artisanId;
  final String? artisanName;
  final String? artisanChannel;

  final String? artisanProfile;
  final Function? onTap;
  final ToolUtil util;

  const BodyCard(
      {super.key,
      this.retainerId,
      this.retainerName,
      this.artisanChannel,
      this.artisanId,
      this.artisanName,
      this.artisanProfile,
      this.onTap,
      required this.util});

  @override
  State<BodyCard> createState() => _BodyCardState();
}

class _BodyCardState extends State<BodyCard> {
  String? retainerName;
  String? retainerId;
  String? artisanId;
  String? artisanName;
  String? artisanChannel;

  String? artisanProfile;

  //标志
  bool? isHasArtisan;
  bool? isSelect;

  @override
  void initState() {
    super.initState();

    retainerName = widget.retainerName;
    retainerId = widget.artisanId;
    artisanId = widget.artisanId;
    artisanName = widget.artisanName;
    artisanChannel = widget.artisanChannel;
    artisanProfile = widget.artisanProfile;

    isSelect = false;
    isHasArtisan = widget.artisanId == null ? false : true;

    //注册方法
    widget.util.addListFuncBidingArtisanBodySelected(setSelected);
  }

  @override
  Widget build(BuildContext context) {
    return
      Container(
        margin: const EdgeInsets.only(bottom: 16),
        width: MediaQuery.of(context).size.width <= 1920
            ? (1920 - 24) / 24 * 7 - 24
            : (1920 - 24) / 24 * 7 - 24,
        child: Container(
          alignment: Alignment.topRight,
          child:  InkWell(
      onTap: bodyOnTap,
      borderRadius: BorderRadius.circular(16),
            
            child: Container(
              width: MediaQuery.of(context).size.width <= 1920
                  ? (1920 - 24) / 24 * 7 - 24 - 24 - 24
                  : (1920 - 24) / 24 * 7 - 24 - 24 - 24,
              decoration: KDecoration.cardDecoration,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(16),
                          topRight: const Radius.circular(16),
                          bottomLeft: isHasArtisan == false
                              ? const Radius.circular(16)
                              : const Radius.circular(0),
                          bottomRight: isHasArtisan == false
                              ? const Radius.circular(16)
                              : const Radius.circular(0),
                        ),
                        color: isHasArtisan == true
                            ? KColor.primaryColor
                            : isSelect == true
                                ? KColor.primaryColor
                                : KColor.containerColor),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: 22,
                            width: 22,
                            child: SvgPicture.asset('Svg/retainer_tool.svg',
                                color: isHasArtisan == true || isSelect == true
                                    ? Colors.white
                                    : Colors.black),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          SizedBox(
                            height: 22,
                            child: Text(
                              '雇员 : ${retainerName!}',
                              style: isHasArtisan == true || isSelect == true
                                  ? KFont.expansionHeadSelectedStyle
                                  : KFont.expansionHeadUnSelectStyle,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                          const Expanded(
                            child: SizedBox(),
                          ),
                          SizedBox(
                            height: 22,
                            child: Text(
                              retainerId!,
                              style: isHasArtisan == true || isSelect == true
                                  ? KFont.expansionHeadSelectedStyle
                                  : KFont.expansionHeadUnSelectStyle,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  isHasArtisan != true
                      ? const SizedBox()
                      : SizedBox(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 12),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                    height: 17,
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            artisanId!,
                                            style: KFont.cardProfileStyle,
                                          ),
                                          const Expanded(child: SizedBox()),
                                          Text(
                                            artisanChannel!,
                                            style: KFont.cardProfileStyle,
                                          )
                                        ])),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Column(children: [
                                        Text(
                                          artisanName!,
                                          style: KFont.cardTitleStyle,
                                        ),
                                        const SizedBox(
                                          height: 12,
                                        ),
                                        Text(
                                          artisanProfile!,
                                          style: KFont.cardProfileStyle,
                                        )
                                      ]),
                                      const Expanded(
                                        child: SizedBox(),
                                      ),
                                      InkWell(
                                        onTap: onRemoveArtisanTap,
                                        borderRadius: BorderRadius.circular(99),
                                        child: SizedBox(
                                          height: 26,
                                          width: 26,
                                          child: SvgPicture.asset(
                                              'Svg/minus_card.svg'),
                                        ),
                                      )
                                    ]),
                              ],
                            ),
                          ),
                        )
                ],
              ),
            ),
          ),
        ),
      
    );
  }

  void onRemoveArtisanTap() {
    widget.onTap!();
    removeArtisan();
    refreshUi();
  }

  void removeArtisan() {
    isHasArtisan = false;
    artisanId = null;
    artisanChannel = null;
    artisanName = null;
    artisanProfile = null;
  }

  void refreshUi() {
    setState(() {});
  }

  void setSelected(bool i) {
    isSelect = i;
    refreshUi();
  }

  void bodyOnTap() {
    widget.onTap!();
    setSelected(true);
  }

  @override
  void dispose() {
    super.dispose();
    widget.util.removeListFuncBidingArtisanBodySelected(setSelected);
  }
}
