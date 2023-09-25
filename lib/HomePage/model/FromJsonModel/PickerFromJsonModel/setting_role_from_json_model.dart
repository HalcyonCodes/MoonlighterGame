class SettingRolePickerModel {
  late String code;
  late String message;
  late SettingRolePickerData data;

  SettingRolePickerModel();

  SettingRolePickerModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if(json['data'] != null){
      data = SettingRolePickerData.fromJson(json['data']);
    }
  }
}



class SettingRolePickerData {
  late List<PickerRole> roles;

  SettingRolePickerData();

  SettingRolePickerData.fromJson(Map<String, dynamic> json) {
    roles = [];
    if (json['roles'] != null) {
      json['roles'].forEach((e) {
        roles.add(PickerRole.fromJson(e));
      });
    }
  }
}

class PickerRole {
  late String roleId;
  late String roleName;
  late String roleCategory;
  late String roleDesc;

  PickerRole();

  PickerRole.fromJson(Map<String, dynamic> json) {
    roleId = json['roleId'];
    roleCategory = json['roleCategory'];
    roleDesc = json['roleDesc'];
    roleName = json['roleName'];
  }
}
