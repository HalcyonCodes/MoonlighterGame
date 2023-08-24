import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moonlighter/Config/index.dart';


class CompanyCard extends StatefulWidget {

  final String? companyId;
  final String? companyName;
  final String? companyChannel;
  final String? companyProfile;
  final Function()? onTap;

  final String? memberCount;
  final String? marketValue;

  const CompanyCard(
      {super.key,
      this.companyChannel,
      this.companyId,
      this.companyName,
      this.companyProfile,
      this.onTap,
      this.memberCount,
      this.marketValue});

  @override
  State<CompanyCard> createState() => _CompanyCardState();
}

class _CompanyCardState extends State<CompanyCard> {

  String? companyId;
  String? companyName;
  String? companyChannel;
  String? companyProfile;
  String? memberCount;
  String? marketValue;



  @override
  void initState() {
    super.initState();
    companyId = widget.companyId;
    companyName = widget.companyName;
    companyChannel = widget.companyChannel;
    companyProfile = widget.companyProfile;
    memberCount = widget.memberCount;
    marketValue = widget.marketValue;


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
                ? (1920 - 24) / 24 * 8 - 24
                : (1920 - 24) / 24 * 8 - 24,
            decoration: KDecoration.cardDecoration,
            child: Column(
              children: [ SizedBox(
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
                                        onTap: onAddTap,
                                        borderRadius: BorderRadius.circular(99),
                                        child: SizedBox(
                                          height: 26,
                                          width: 26,
                                          child: SvgPicture.asset(
                                              'Svg/plus_card.svg'),
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

  void onAddTap() {
    removeArtisan();
    refreshUi();
  }

  void removeArtisan() {

    //假如修改viewmodel逻辑
    refreshUi();
  }

  void refreshUi() {
    setState(() {});
  }




  @override
  void dispose() {
    super.dispose();
    
  }
}
