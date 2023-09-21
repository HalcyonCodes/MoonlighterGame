import '../../FromJsonModel/ToolFromJsonModel/setting_company_from_json_model.dart';

class SettingCompanyToJsonModel {
  Map<String, List> roles = {};

  SettingCompanyToJsonModel();

  SettingCompanyToJsonModel.toJsonModel(SettingCompanyToolModel fromJsonModel) {
    roles['roles'] = [];
    for(var vRole in fromJsonModel.data.roles){
      roles['roles']!.add(RoleToJsonModel.toJsonModel(vRole));
    }
  }
}

class RoleToJsonModel {
  Map<String, dynamic> role = {};

  RoleToJsonModel();

  RoleToJsonModel.toJsonModel(Role vRole) {
    role['roleId'] = vRole.roleId;
    role['roleName'] = vRole.roleName;
    role['roleChannel'] = vRole.roleChannel;
    if (vRole.company != null) {
      role['company'] = CompanyToJsonModel.toJsonModel(vRole.company!);
    } else {
      role['company'] = '';
    }
  }
}

class CompanyToJsonModel {
  Map<String, String> company = {};

  CompanyToJsonModel();

  CompanyToJsonModel.toJsonModel(Company vCompany) {
    company['companyId'] = vCompany.companyId;
    company['companyName'] = vCompany.companyName;
    company['companyDesc'] = vCompany.companyDesc;
    company['companyChannel'] = vCompany.companyChannel;
    company['companyMembers'] = vCompany.companyMembers;
    company['companyMarketValue'] = vCompany.companyMarkerValue;
  }
}
