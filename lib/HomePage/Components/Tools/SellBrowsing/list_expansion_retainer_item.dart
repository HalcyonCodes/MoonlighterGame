import 'package:flutter/material.dart';
import '../../../../ToolWidgets/rectangle_cliper.dart';
import './expansion_retainer_item.dart';
import '../../Util/util_tools.dart';
import '../../../Model/ViewModel/ToolViewModel/sell_browsing_view_model.dart';
import '../../Util/util_picker.dart';

//包裹所有角色-雇员手风琴的列表
class ItemRetainerList extends StatefulWidget {
  final ToolUtil toolUtil;
  final PickerUtil pickerUtil;
  final SellBrowsingToolViewModel viewModel;

  const ItemRetainerList({super.key, required this.toolUtil, required this.viewModel, required this.pickerUtil});

  @override
  State<ItemRetainerList> createState() => _ItemRetainerListState();
}

class _ItemRetainerListState extends State<ItemRetainerList> {
  List<ItemExpansionRetainer>? items;

  @override
  void initState() {
    super.initState();
    //初始化
    widget.toolUtil.setListFuncSellBrowsingBodySelected([]);
    widget.toolUtil.setListFuncSellBrowsingHeadSelected([]);
  }

  @override
  Widget build(BuildContext context) {
    //初始化数据的地方
    items = List.generate(widget.viewModel.sellBrowsingToolModel!.data!.roles!.length, (index) {
      return ItemExpansionRetainer(
       roleId: widget.viewModel.sellBrowsingToolModel!.data!.roles![index].roleId,
        roleName: widget.viewModel.sellBrowsingToolModel!.data!.roles![index].roleName,
        roleChannel: widget.viewModel.sellBrowsingToolModel!.data!.roles![index].roleChannel,
        toolUtil: widget.toolUtil,
        role: widget.viewModel.sellBrowsingToolModel!.data!.roles![index],
        viewModel: widget.viewModel,
        pickerUtil: widget.pickerUtil,
        headTap: () {
          onTap(index);
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

  void onTap(index) {
    //print(widget.toolUtil.listFuncSetItemBrowsingSelected!.length);
    for (int i = 0;
        i <= widget.toolUtil.listFuncSellBrowsingHeadSelected!.length - 1;
        i++) {
      widget.toolUtil.listFuncSellBrowsingHeadSelected![i](false);
    }
    widget.toolUtil.listFuncSellBrowsingHeadSelected![index](true);
  
    //清空body选中
    for (int i = 0;
        i <= widget.toolUtil.listFuncSellBrowsingBodySelected!.length - 1;
        i++) {
      widget.toolUtil.listFuncSellBrowsingBodySelected![i](false);
    }
  
  
  }




}
