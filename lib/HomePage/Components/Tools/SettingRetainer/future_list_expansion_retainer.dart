import 'package:flutter/material.dart';
import '../../../Model/ViewModel/ToolViewModel/setting_retainer_view_model.dart';
import '../../Util/util_tools.dart';
import './list_expansion_retainer.dart';

class RetainerListFuture extends StatefulWidget {
  final ToolUtil toolUtil;
  final SettingRetainerViewModel viewModel;

  const RetainerListFuture(
      {super.key, required this.viewModel, required this.toolUtil});

  @override
  State<RetainerListFuture> createState() => _RetainerListFutureState();
}

class _RetainerListFutureState extends State<RetainerListFuture> {
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
              return RetainerList(toolUtil: widget.toolUtil, viewModel: widget.viewModel,);
          }
        });
  }
}
