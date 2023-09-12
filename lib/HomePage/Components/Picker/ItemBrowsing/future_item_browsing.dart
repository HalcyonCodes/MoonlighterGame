import 'package:flutter/material.dart';

import '../../../Model/ViewModel/PickerViewModel/item_browsing_view_model.dart';
import './item_browsing.dart';
import '../../Util/util_tools.dart';

class PickerItemBrowsingFuture extends StatefulWidget {
  final ToolUtil toolUtil;
  final ItemBrowsingPickerViewModel viewModel = ItemBrowsingPickerViewModel();
  PickerItemBrowsingFuture({super.key, required this.toolUtil});

  @override
  State<PickerItemBrowsingFuture> createState() =>
      _PickerItemBrowsingFutureState();
}

class _PickerItemBrowsingFutureState extends State<PickerItemBrowsingFuture> {
  
  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return widget.toolUtil.currentRetainerId != null
        ? FutureBuilder(
            future:
                widget.viewModel.refresh(widget.toolUtil.currentRetainerId!),
            builder: (context, snapShot) {
              switch (snapShot.connectionState) {
                case ConnectionState.none:
                  return Text('done');
                case ConnectionState.active:
                  return Text('active');
                case ConnectionState.waiting:
                  return Center(child: Text('waiting'));
                case ConnectionState.done:
                  return PickerItemBrowsing(
                    viewModel: widget.viewModel,
                  );
              }
            })
        : const SizedBox();
  }

  void refreshUi() {
    setState(() {});
  }
}
