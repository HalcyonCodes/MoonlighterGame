class SettingCompanyToolModel {
  late String code;
  late String message;
  late SettingCompanyToolData data;

  SettingCompanyToolModel();

  SettingCompanyToolModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if(json['data'] != null){
      data = SettingCompanyToolData.fromJson(json['data']);
    }
  }
}

class SettingCompanyToolData {
  late List<Role> roles;

  SettingCompanyToolData();

  SettingCompanyToolData.fromJson(Map<String, dynamic> json) {
    roles = [];
    if (json['roles'] != null) {
      json['roles'].forEach((v) => roles.add(Role.fromJson(v)));
    }
  }
}

class Role {
  late String roleId;
  late String roleName;
  late String roleChannel;
  late Company? company;

  Role();

  Role.fromJson(Map<String, dynamic> json) {
    roleId = json['roleId'];
    roleName = json['roleName'];
    roleChannel = json['roleChannel'];
    if (json['company'] != null) {
      company = Company.fromJson(json['company']);
    }
  }
}

class Company {
  late String companyId;
  late String companyName;
  late String companyDesc;
  late String companyChannel;
  late String companyMembers;
  late String companyMarkerValue;

  Company();

  Company.fromJson(Map<String, dynamic> json) {
    companyId = json['companyId'];
    companyName = json['companyName'];
    companyDesc = json['companyDesc'];
    companyChannel = json['companyChannel'];
    companyMembers = json['companyMembers'];
    companyMarkerValue = json['companyMarketValue'];
  }
}
