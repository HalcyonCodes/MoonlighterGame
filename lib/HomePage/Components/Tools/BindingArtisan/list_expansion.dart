import 'package:flutter/material.dart';
import '../../../../ToolWidgets/rectangle_cliper.dart';
import './expansion_artisan.dart';
import '../../Util/util_tools.dart';
import '../../../Model/ViewModel/ToolViewModel/binding_artisan_view_model.dart';

//expansion的列表

class ExpansionList extends StatefulWidget {
  final ToolUtil util;
  final BindingArtisanToolViewModel viewModel;

  const ExpansionList({super.key, required this.util, required this.viewModel});

  @override
  State<ExpansionList> createState() => _ExpansionListState();
}

class _ExpansionListState extends State<ExpansionList> {
  List<Widget>? items;

  @override
  void initState() {
    super.initState();

    //初始化
    items = List.generate(
        widget.viewModel.bindingArtisanToolModel!.data.roles.length, (index) {
      return ExpansionArtisan(
        key: UniqueKey(),
        roleChannel: widget
            .viewModel.bindingArtisanToolModel!.data.roles[index].roleChannel,
        roleId:
            widget.viewModel.bindingArtisanToolModel!.data.roles[index].roleId,
        roleName: widget
            .viewModel.bindingArtisanToolModel!.data.roles[index].roleName,
        util: widget.util,
        role: widget.viewModel.bindingArtisanToolModel!.data.roles[index],
        viewModel: widget.viewModel,
        headTap: () {
          headTap(index);
        },
      );
    });

    //注册
    widget.util.setListFuncBidingArtisanHeadSelected([]);
    widget.util.setListFuncBidingArtisanBodySelected([]);
    widget.util.setListFuncInsertArtisan([]);
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

  void headTap(int index) {
    for (int i = 0;
        i <= widget.util.listFuncBidingArtisanHeadSelected!.length - 1;
        i++) {
      widget.util.listFuncBidingArtisanHeadSelected![i](false);
    }
    widget.util.listFuncBidingArtisanHeadSelected![index](true);
    widget.util.setCurrentRoleIndex(index);

    //设置所有body的选中状态
       for (int i = 0;
        i <= widget.util.listFuncBidingArtisanBodySelected!.length - 1;
        i++) {
      widget.util.listFuncBidingArtisanBodySelected![i](false);
    }

  }


  
}
