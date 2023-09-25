import 'package:flutter/material.dart';
import '../../../../ToolWidgets/rectangle_cliper.dart';
import '../../Util/util_tools.dart';
import '../../../Model/ViewModel/ToolViewModel/setting_role_view_model.dart';
import '../../Util/util_picker.dart';
import './expansion_role.dart';

//包裹所有角色-雇员手风琴的列表
class ItemRoleList extends StatefulWidget {
  final ToolUtil toolUtil;
  final PickerUtil pickerUtil;
  final SettingRoleToolViewModel viewModel;

  const ItemRoleList(
      {super.key,
      required this.toolUtil,
      required this.pickerUtil,
      required this.viewModel});

  @override
  State<ItemRoleList> createState() => _ItemRoleListState();
}

class _ItemRoleListState extends State<ItemRoleList> {
  List<ExpansionRole>? items;

  @override
  void initState() {
    super.initState();
    //初始化
    widget.toolUtil.setListFuncSettingShelfBodySelected([]);
    widget.toolUtil.setListFuncSettingShelfHeadSelected([]);
    widget.toolUtil.setListFuncInsertRole([]);
    widget.toolUtil.setListFuncChangeMemberCount([]);
  }

  @override
  Widget build(BuildContext context) {
    //初始化数据的地方
    items = List.generate(
        widget.viewModel.settingRoleToolModel!.data.channels.length, (index) {
      return ExpansionRole(
        toolUtil: widget.toolUtil,
        viewModel: widget.viewModel,
        channel: widget.viewModel.settingRoleToolModel!.data.channels[index],
        pickerUtil: widget.pickerUtil,
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

  void onTap(index) {
    for (int i = 0;
        i <= widget.toolUtil.listFuncSettingRoleHeadSelected!.length - 1;
        i++) {
      widget.toolUtil.listFuncSettingRoleHeadSelected![i](false);
    }
    widget.toolUtil.listFuncSettingRoleHeadSelected![index](true);
  }
}
