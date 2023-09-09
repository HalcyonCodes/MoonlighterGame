import 'package:flutter/material.dart';
import '../../../../ToolWidgets/rectangle_cliper.dart';
import './expansion_retainer.dart';
import '../../Util/util_tools.dart';
import '../../../Model/ViewModel/ToolViewModel/setting_retainer_view_model.dart';

class RetainerList extends StatefulWidget {
  final ToolUtil toolUtil;
  final SettingRetainerViewModel viewModel;

  const RetainerList({super.key, required this.toolUtil, required this.viewModel});

  @override
  State<RetainerList> createState() => _RetainerListState();
}

class _RetainerListState extends State<RetainerList> {
  List<ExpansionRetainer>? items;

  @override
  void initState() {


    super.initState();

    //初始化
    widget.toolUtil.setListFuncSetExpansionRoleCardSelected([]);
  }

  @override
  Widget build(BuildContext context) {
    //初始化数据的地方
    items = List.generate(widget.viewModel.settingRetainerToolModel!.data!.roles!.length, (index) {
      return ExpansionRetainer(
        roleId: widget.viewModel.settingRetainerToolModel!.data!.roles![index].roleId,
        roleName: widget.viewModel.settingRetainerToolModel!.data!.roles![index].roleName,
        roleChannel: widget.viewModel.settingRetainerToolModel!.data!.roles![index].roleChannel,
        util: widget.toolUtil,
        role: widget.viewModel.settingRetainerToolModel!.data!.roles![index],
        viewModel: widget.viewModel,
        headTap: () {
          ontap(index);
        },
      );
    });

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
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: SingleChildScrollView(
            clipBehavior: Clip.none,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: items!,
            ),
          ),
        ),
      ),
    );
  }

  void ontap(index) {
    for (int i = 0;
        i <= widget.toolUtil.listFuncSetExpansionRoleCardSelected!.length - 1;
        i++) {
      widget.toolUtil.listFuncSetExpansionRoleCardSelected![i](false);
    }
    widget.toolUtil.listFuncSetExpansionRoleCardSelected![index](true);
  }

}
