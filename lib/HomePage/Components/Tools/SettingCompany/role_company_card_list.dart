import 'package:flutter/material.dart';
import '../../../../ToolWidgets/rectangle_cliper.dart';
import '../../Util/util_tools.dart';
import './role_company_card.dart';

//expansion的列表

class RoleCompanyCardList extends StatefulWidget {
  final ToolUtil util;

  const RoleCompanyCardList({super.key, required this.util});

  @override
  State<RoleCompanyCardList> createState() => _RoleCompanyCardListState();
}

class _RoleCompanyCardListState extends State<RoleCompanyCardList> {
  List<Widget>? items;

  @override
  void initState() {
    super.initState();

    //初始化
    items = List.generate(3, (index) {
      return RoleCompanyCard(
        key: UniqueKey(),
        util: widget.util,
        roleId: '123',
        roleName: '沼泽小鳄',
        roleChannel: '静语庄园',
        companyId: '123-123-123',
        companyName: '字节跳动',
        companyChannel: '静语庄园',
        companyProfile: '互联网大厂',
        memberCount: '16',
        marketValue: '130,000,000',
        onTap: () {
          onCardTap(index);
        },
      );
    });

    //注册
    widget.util.setListFuncSettingCompanySetSelect([]);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height -
          24 -
          24 -
          46 -
          (55 + 8 + 17 + 16) * 3 -
          32 -
          46 -
          16,
      child: ClipPath(
          clipper: RectangleClipper(),
          child: ScrollConfiguration(
            behavior:
                ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: ListView(
              children: items!,
            ),
          )),
    );
  }

  void onCardTap(int index) {
    for (int i = 0;
        i <=  widget.util.listFuncSettingCompanySetSelect!.length - 1;
        i++) {
      widget.util.listFuncSettingCompanySetSelect![i](false);
    }
    widget.util.listFuncSettingCompanySetSelect![index](true);
  }
}
