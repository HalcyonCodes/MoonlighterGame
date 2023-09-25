import '../../FromJsonModel/PickerFromJsonModel/setting_role_from_json_model.dart';

class SettingRoleToJsonModel {
  Map<String, dynamic> roles = {};

  SettingRoleToJsonModel();

  SettingRoleToJsonModel.toJsonModel(SettingRolePickerModel vModel) {
    roles['roles'] = [];
    for(int i = 0; i < vModel.data.roles.length; i++){
      roles['roles'].add(RoleToJsonModel.toJsonModel(vModel.data.roles[i]));

    }
  }
}

class RoleToJsonModel {
  Map<String, dynamic> role = {};

  RoleToJsonModel();

  RoleToJsonModel.toJsonModel(PickerRole vRole) {
    role['roleId'] = vRole.roleId;
    role['roleName'] = vRole.roleName;
    role['roleCategory'] = vRole.roleCategory;
    role['roleDesc'] = vRole.roleId;
  }
}
