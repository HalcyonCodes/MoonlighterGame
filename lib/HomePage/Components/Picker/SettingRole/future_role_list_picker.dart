import 'package:flutter/material.dart';
import '../../../Model/ViewModel/PickerViewModel/setting_role_view_model.dart';
import './role_list_picker.dart';
import '../../Util/util_tools.dart';
import '../../Util/util_picker.dart';

class PickerRoleListFuture extends StatefulWidget {
  final SettingRolePickerViewModel viewModel;
  final PickerUtil pickerUtil;
  final ToolUtil toolUtil;
  const PickerRoleListFuture(
      {super.key,
      required this.viewModel,
      required this.pickerUtil,
      required this.toolUtil});

  @override
  State<PickerRoleListFuture> createState() => _PickerRoleListFutureState();
}

class _PickerRoleListFutureState extends State<PickerRoleListFuture> {
  @override
  void initState() {
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: widget.viewModel.refresh(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Text('none');

            case ConnectionState.waiting:
              return Text('waiting');

            case ConnectionState.active:
              return Text('active');

            case ConnectionState.done:
              return PickerRoleList(
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
