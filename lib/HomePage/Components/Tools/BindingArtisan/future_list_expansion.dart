import 'package:flutter/material.dart';
import '../../../Model/ViewModel/ToolViewModel/binding_artisan_view_model.dart';
import '../../Util/util_tools.dart';
import './list_expansion.dart';

class ExpansionListFuture extends StatefulWidget {
  final BindingArtisanToolViewModel viewModel;
  final ToolUtil toolUtil;

  const ExpansionListFuture({super.key, required this.toolUtil, required this.viewModel});

  @override
  State<ExpansionListFuture> createState() => _ExpansionListFutureState();
}

class _ExpansionListFutureState extends State<ExpansionListFuture> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: widget.viewModel.refresh(widget.toolUtil.listSelectId!),
        builder: ((context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Text('none');
            case ConnectionState.waiting:
              return Text('waiting');
            case ConnectionState.active:
              return Text('active');
            case ConnectionState.done:
              return ExpansionList(util: widget.toolUtil, viewModel: widget.viewModel);
          }
        }));
  }
}
