import 'package:flutter/material.dart';
import '../../Util/util_picker.dart';
import '../../Util/util_tools.dart';
import '../../../Model/ViewModel/PickerViewModel/setting_retainer_view_model.dart';
import './retainer_list_picker.dart';

class PickerRetainerListFuture extends StatefulWidget {
  final ToolUtil toolUtil;
  final PickerUtil pickerUtil;
  final SettingRetainerPickerViewModel viewModel;
  const PickerRetainerListFuture(
      {super.key,
      required this.viewModel,
      required this.toolUtil,
      required this.pickerUtil});

  @override
  State<PickerRetainerListFuture> createState() =>
      _PickerRetainerListFutureState();
}

class _PickerRetainerListFutureState extends State<PickerRetainerListFuture> {
  @override
  void initState() {
    super.initState();

    
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: widget.viewModel.refresh(widget.toolUtil.listSelectId!),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Text('none');

            case ConnectionState.active:
              return Text('active');

            case ConnectionState.waiting:
              return Text('waiting');

            case ConnectionState.done:
              return PickerRetainerList(viewModel: widget.viewModel, pickerUtil: widget.pickerUtil, toolUtil: widget.toolUtil,);
          }
        });
  }

  void refreshUi() {
    setState(() {});
  }
}
