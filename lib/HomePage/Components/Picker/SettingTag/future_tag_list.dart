import 'package:flutter/material.dart';
import '../../Util/util_tools.dart';
import '../../Util/util_picker.dart';
import '../../../Model/ViewModel/PickerViewModel/setting_tag_view_model.dart';
import './tag_list_picker.dart';

class PickerTagListFuture extends StatefulWidget {
  final ToolUtil toolUtil;
  final PickerUtil pickerUtil;
  final SettingTagPickerViewModel viewModel;

  const PickerTagListFuture(
      {super.key,
      required this.pickerUtil,
      required this.toolUtil,
      required this.viewModel});

  @override
  State<PickerTagListFuture> createState() => _PickerTagListFutureState();
}

class _PickerTagListFutureState extends State<PickerTagListFuture> {
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
              return Text('done');

            case ConnectionState.active:
              return Text('active');

            case ConnectionState.waiting:
              return Text('waiting');

            case ConnectionState.done:
              return PickerTagList(
                viewModel: widget.viewModel,
                pickerUtil: widget.pickerUtil,
                toolUtil: widget.toolUtil,
              );
          }
        });
  }

  void refreshUi() {
    setState(() {});
  }
}
