import 'package:flutter/material.dart';
import './role_company_card_list.dart';
import '../../../Model/ViewModel/ToolViewModel/setting_company_view_model.dart';
import '../../Util/util_tools.dart';

class RoleCompanyCardListFuture extends StatefulWidget {
  final SettingCompanyToolViewModel viewModel;
  final ToolUtil toolUtil;
  const RoleCompanyCardListFuture(
      {super.key, required this.viewModel, required this.toolUtil});

  @override
  State<RoleCompanyCardListFuture> createState() =>
      _RoleCompanyCardListFutureState();
}

class _RoleCompanyCardListFutureState extends State<RoleCompanyCardListFuture> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: widget.viewModel.refresh(widget.toolUtil.listSelectId!),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Text('none');

            case ConnectionState.waiting:
              return Text('waiting');

            case ConnectionState.active:
              return Text('active');

            case ConnectionState.done:
              return RoleCompanyCardList(
                util: widget.toolUtil, viewModel: widget.viewModel,

              );
          }
        });
  }
}
