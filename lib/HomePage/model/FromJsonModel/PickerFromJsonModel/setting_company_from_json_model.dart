class SettingCompanyPickerModel {
  late String code;
  late String message;
  late SettingCompanyPickerData data;

  SettingCompanyPickerModel();

  SettingCompanyPickerModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if(json['data'] != null){
      data = SettingCompanyPickerData.fromJson(json['data']);
    }
    
  }
}

class SettingCompanyPickerData {
  late List<PickerCompany> companys;

  SettingCompanyPickerData();

  SettingCompanyPickerData.fromJson(Map<String, dynamic> json) {
    companys = [];

    if (json['companys'] != null) {
      json['companys'].forEach((v) => companys.add(PickerCompany.fromJson(v)));
    }
  }
}

class PickerCompany {
  late String companyId;
  late String companyName;
  late String companyDesc;
  late String companyChannel;
  late String companyMembers;
  late String companyMarkerValue;

  PickerCompany();

  PickerCompany.fromJson(Map<String, dynamic> json) {
    companyId = json['companyId'];
    companyName = json['companyName'];
    companyDesc = json['companyDesc'];
    companyChannel = json['companyChannel'];
    companyMembers = json['companyMembers'];
    companyMarkerValue = json['companyMarketValue'];
  }
}
