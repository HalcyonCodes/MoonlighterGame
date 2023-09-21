import 'package:flutter/material.dart';
import 'package:moonlighter/HomePage/Components/Picker/SettingCompany/future_company_list.dart';
import 'package:moonlighter/HomePage/Components/Util/util_tools.dart';
import 'package:moonlighter/HomePage/Model/ViewModel/PickerViewModel/setting_company_view_model.dart';


class PickerSettingCompany extends StatelessWidget {

  final SettingCompanyPickerViewModel viewModel = SettingCompanyPickerViewModel();
  final ToolUtil toolUtil;

  PickerSettingCompany({super.key, required this.toolUtil});

  @override
  Widget build(BuildContext context) {
    return CompanyListFuture(viewModel: viewModel, toolUtil: toolUtil,);
  }
}
