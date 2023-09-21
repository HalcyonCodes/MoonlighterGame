import 'package:flutter/material.dart';
import '../../../Model/ViewModel/ToolViewModel/sell_browsing_view_model.dart';
import '../../Util/util_tools.dart';
import './list_expansion_retainer_item.dart';
import '../../Util/util_picker.dart';

class ItemRetainerListFuture extends StatelessWidget {
  final SellBrowsingToolViewModel viewModel;
  final ToolUtil toolUtil;
  final PickerUtil pickerUtil;

  const ItemRetainerListFuture(
      {super.key, required this.viewModel, required this.toolUtil, required this.pickerUtil});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: viewModel.refresh(toolUtil.listSelectId!),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Text('none');
            case ConnectionState.waiting:
              return Text('waiting');
            case ConnectionState.active:
              return Text('active');
            case ConnectionState.done:
              return ItemRetainerList(
                toolUtil: toolUtil,
                pickerUtil: pickerUtil,
                viewModel: viewModel,
              );
          }
        });
  }
}