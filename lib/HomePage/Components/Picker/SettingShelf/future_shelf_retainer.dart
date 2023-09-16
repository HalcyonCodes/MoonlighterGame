import 'package:flutter/material.dart';
import '../../../Model/ViewModel/PickerViewModel/setting_shelf_view_model.dart';
import './shelf_retainer.dart';
import '../../Util/util_picker.dart';
import '../../Util/util_tools.dart';

class RetainerShelfFuture extends StatefulWidget {
  final SettingShelfPickerViewModel viewModel;
  final PickerUtil pickerUtil;
  final ToolUtil toolUtil;

  const RetainerShelfFuture(
      {super.key,
      required this.viewModel,
      required this.pickerUtil,
      required this.toolUtil});

  @override
  State<RetainerShelfFuture> createState() => _RetainerShelfFutureState();
}

class _RetainerShelfFutureState extends State<RetainerShelfFuture> {
  @override
  void initState() {
    super.initState();

    //注册
    widget.pickerUtil.setFuncRefreshSettingShelfFuture(refreshUi);
  }

  @override
  Widget build(BuildContext context) {
    return 
    widget.toolUtil.currentRetainerId == null? 
    const SizedBox() :
    FutureBuilder(
        future: widget.viewModel.refresh(widget.toolUtil.currentRetainerId!),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Text('none');

            case ConnectionState.waiting:
              return Text('waiting');

            case ConnectionState.active:
              return Text('active');

            case ConnectionState.done:
              return RetainerShelf(
                viewModel: widget.viewModel,
                pickerUtil: widget.pickerUtil, toolUtil: widget.toolUtil,
              );
          }
        });
  }

  void refreshUi() {
    setState(() {});
  }
}
