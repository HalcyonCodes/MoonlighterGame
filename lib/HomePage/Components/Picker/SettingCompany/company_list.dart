import 'package:flutter/material.dart';
import '../../../../ToolWidgets/rectangle_cliper.dart';
import './company_card.dart';
import '../../../Model/ViewModel/PickerViewModel/setting_company_view_model.dart';
import '../../../Model/FromJsonModel/ToolFromJsonModel/setting_company_from_json_model.dart';
import '../../Util/util_tools.dart';

class CompanyList extends StatefulWidget {
  final SettingCompanyPickerViewModel viewModel;
  final ToolUtil toolUtil;

  const CompanyList(
      {super.key, required this.toolUtil, required this.viewModel});

  @override
  State<CompanyList> createState() => _CompanyListState();
}

class _CompanyListState extends State<CompanyList> {
  List<Widget>? items;

  @override
  void initState() {
    super.initState();
    items = List.generate(
        widget.viewModel.settingCompanyPickerModel!.data.companys.length,
        (index) {
      return CompanyCard(
        companyName: widget.viewModel.settingCompanyPickerModel!.data
            .companys[index].companyName,
        companyChannel: widget.viewModel.settingCompanyPickerModel!.data
            .companys[index].companyChannel,
        companyId: widget.viewModel.settingCompanyPickerModel!.data
            .companys[index].companyId,
        companyProfile: widget.viewModel.settingCompanyPickerModel!.data
            .companys[index].companyDesc,
        memberCount: widget.viewModel.settingCompanyPickerModel!.data
            .companys[index].companyMembers,
        marketValue: widget.viewModel.settingCompanyPickerModel!.data
            .companys[index].companyMarkerValue,
        onTap: () {
          insertCompany(index);
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 24 - 24,
      child: ClipPath(
        clipper: RectangleClipper(),
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: ListView(
            clipBehavior: Clip.none,
            children: items!,
          ),
        ),
      ),
    );
  }

  void insertCompany(int index) {
    Company company = Company();
    company.companyId = widget
        .viewModel.settingCompanyPickerModel!.data.companys[index].companyId;
    company.companyName = widget
        .viewModel.settingCompanyPickerModel!.data.companys[index].companyName;
    company.companyDesc = widget
        .viewModel.settingCompanyPickerModel!.data.companys[index].companyDesc;
    company.companyChannel = widget.viewModel.settingCompanyPickerModel!.data
        .companys[index].companyChannel;
    company.companyMembers = widget.viewModel.settingCompanyPickerModel!.data
        .companys[index].companyMembers;
    company.companyMarkerValue = widget.viewModel.settingCompanyPickerModel!
        .data.companys[index].companyMarkerValue;
    widget.toolUtil.insertCompany!(widget.toolUtil.currentRoleIndex, company);
  }
}
