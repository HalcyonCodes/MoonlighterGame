import 'package:flutter/material.dart';
import '../../Util/util_picker.dart';
import '../../../Model/ViewModel/PickerViewModel/sell_browsing_view_model.dart';
import '../../Util/util_tools.dart';
import './item_list_sell.dart';

class SellItemListFuture extends StatefulWidget {
  final SellBrowsingPickerViewModel viewModel;
  final PickerUtil pickerUtil;
  final ToolUtil toolUtil;

  const SellItemListFuture(
      {super.key,
      required this.pickerUtil,
      required this.viewModel,
      required this.toolUtil});

  @override
  State<SellItemListFuture> createState() => _SellItemListFutureState();
}

class _SellItemListFutureState extends State<SellItemListFuture> {
  @override
  void initState() {
    super.initState();
    widget.pickerUtil.setFuncRefreshSellItemListFuture(refreshUi);
  }

  @override
  Widget build(BuildContext context) {
    return widget.viewModel.date == null
        ? const SizedBox()
        : FutureBuilder(
            future: widget.viewModel.refresh(
              widget.toolUtil.currentRetainerId!,
            ),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Text('none');

                case ConnectionState.waiting:
                  return Text('waiting');

                case ConnectionState.active:
                  return Text('active');

                case ConnectionState.done:
                  return SellItemList(viewModel: widget.viewModel);
              }
            });
  }

  void refreshUi() {
    setState(() {});
  }
}
