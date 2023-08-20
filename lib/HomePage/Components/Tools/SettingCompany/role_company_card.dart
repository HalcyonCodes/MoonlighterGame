import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moonlighter/Config/index.dart';
import '../../Util/util_tools.dart';

class RoleCompanyCard extends StatefulWidget {
  final String? roleName;
  final String? roleId;
  final String? roleChannel;
  final String? companyId;
  final String? companyName;
  final String? companyChannel;
  final String? companyProfile;
  final Function()? onTap;
  final ToolUtil util;
  final String? memberCount;
  final String? marketValue;

  const RoleCompanyCard(
      {super.key,
      this.roleId,
      this.roleName,
      this.roleChannel,
      this.companyChannel,
      this.companyId,
      this.companyName,
      this.companyProfile,
      this.onTap,
      required this.util,
      this.memberCount,
      this.marketValue});

  @override
  State<RoleCompanyCard> createState() => _RoleCompanyCardState();
}

class _RoleCompanyCardState extends State<RoleCompanyCard> {
  String? roleName;
  String? roleId;
  String? companyId;
  String? companyName;
  String? companyChannel;
  String? companyProfile;
  String? memberCount;
  String? marketValue;
  String? roleChannel;

  //标志
  bool? isHasCompany;
  bool? isSelect;

  @override
  void initState() {
    super.initState();

    roleName = widget.roleName;
    roleId = widget.roleId;
    roleChannel = widget.roleChannel;
    companyId = widget.companyId;
    companyName = widget.companyName;
    companyChannel = widget.companyChannel;
    companyProfile = widget.companyProfile;
    memberCount = widget.memberCount;
    marketValue = widget.marketValue;

    //绑定方法
    isSelect = false;
    isHasCompany = widget.companyId == null ? false : true;

    //注册方法
    widget.util.addListFuncSettingCompanySetSelect(setSelected);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      width: MediaQuery.of(context).size.width <= 1920
          ? (1920 - 24) / 24 * 7
          : (1920 - 24) / 24 * 7,
      child: Container(
        alignment: Alignment.topRight,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: widget.onTap,
          child: Container(
            width: MediaQuery.of(context).size.width <= 1920
                ? (1920 - 24) / 24 * 7 - 24
                : (1920 - 24) / 24 * 7 - 24,
            decoration: KDecoration.cardDecoration,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(16),
                        topRight: const Radius.circular(16),
                        bottomLeft: isHasCompany == false
                            ? const Radius.circular(16)
                            : const Radius.circular(0),
                        bottomRight: isHasCompany == false
                            ? const Radius.circular(16)
                            : const Radius.circular(0),
                      ),
                      color: isHasCompany == true
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
                          child: SvgPicture.asset('Svg/role_tool.svg',
                              color: isHasCompany == true || isSelect == true
                                  ? Colors.white
                                  : Colors.black),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        SizedBox(
                          height: 22,
                          child: Text(
                            '${roleChannel!} : ${roleName!}',
                            style: isHasCompany == true || isSelect == true
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
                            roleId!,
                            style: isHasCompany == true || isSelect == true
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
                isHasCompany != true
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
                                          companyId!,
                                          style: KFont.cardProfileStyle,
                                        ),
                                        const Expanded(child: SizedBox()),
                                        Text(
                                          companyChannel!,
                                          style: KFont.cardProfileStyle,
                                        )
                                      ])),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(
                                      height: 31,
                                      width: 31,
                                      child: SvgPicture.asset(
                                          'Svg/company_tool.svg'),
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            companyName!,
                                            style: KFont.cardTitleStyle,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          const SizedBox(
                                            height: 12,
                                          ),
                                          Text(
                                            companyProfile!,
                                            style: KFont.cardProfileStyle,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          )
                                        ]),
                                    const Expanded(
                                      child: SizedBox(),
                                    ),
                                    Container(
                                      alignment: Alignment.centerRight,
                                      height: 54,
                                      child: InkWell(
                                        onTap: onRemoveArtisanTap,
                                        borderRadius: BorderRadius.circular(99),
                                        child: SizedBox(
                                          height: 26,
                                          width: 26,
                                          child: SvgPicture.asset(
                                              'Svg/minus_card.svg'),
                                        ),
                                      ),
                                    )
                                  ]),
                              const SizedBox(
                                height: 32,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          KString.memberCount,
                                          style: KFont.cardProfileStyle,
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          memberCount!,
                                          style: KFont.cardPrimaryStyle,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 24,
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          KString.marketValue,
                                          style: KFont.cardProfileStyle,
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          marketValue!,
                                          style: KFont.cardPrimaryStyle,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              )
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
    removeArtisan();
    refreshUi();
  }

  void removeArtisan() {
    isHasCompany = false;
    companyId = null;
    companyName = null;
    companyChannel = null;
    companyProfile = null;
    //假如修改viewmodel逻辑
    refreshUi();
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
    widget.util.removeListFuncSettingCompanySetSelect(setSelected);
  }
}
