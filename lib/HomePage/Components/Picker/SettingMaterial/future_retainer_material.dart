import 'package:flutter/material.dart';
import '../../../Model/ViewModel/PickerViewModel/setting_material_view_model.dart';
import './retainer_material.dart';

import '../../Util/util_picker.dart';
import '../../Util/util_tools.dart';

class  RetainerMaterialFuture extends StatefulWidget {
  final SettingMaterialPickerViewModel viewModel;
  final PickerUtil pickerUtil;
  final ToolUtil toolUtil;

  const  RetainerMaterialFuture(
      {super.key,
      required this.viewModel,
      required this.pickerUtil,
      required this.toolUtil});

  @override
  State< RetainerMaterialFuture> createState() => _RetainerMaterialFutureState();
}

class _RetainerMaterialFutureState extends State< RetainerMaterialFuture> {
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
              return RetainerMaterial(
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
