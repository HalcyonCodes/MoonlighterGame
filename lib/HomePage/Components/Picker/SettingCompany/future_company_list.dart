import 'package:flutter/material.dart';
import '../../../Model/ViewModel/PickerViewModel/setting_company_view_model.dart';
import '../../Util/util_tools.dart';
import './company_list.dart';

class CompanyListFuture extends StatefulWidget {
  final SettingCompanyPickerViewModel viewModel;
  final ToolUtil toolUtil;
  const CompanyListFuture(
      {super.key, required this.toolUtil, required this.viewModel});

  @override
  State<CompanyListFuture> createState() => _CompanyListFutureState();
}

class _CompanyListFutureState extends State<CompanyListFuture> {
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
              return CompanyList(
                  toolUtil: widget.toolUtil, viewModel: widget.viewModel);
          }
        });
  }
}
