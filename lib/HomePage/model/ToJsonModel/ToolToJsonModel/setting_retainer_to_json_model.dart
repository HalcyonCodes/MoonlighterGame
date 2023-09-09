import '../../FromJsonModel/ToolFromJsonModel/setting_retainer_from_json_model.dart';

class SettingRetainerToJsonModel {
  Map<String, List> roles = {};

  SettingRetainerToJsonModel();

  SettingRetainerToJsonModel.toJsonModel(
      SettingRetainerToolModel fromJsonModel) {
    roles['roles'] = [];
    for (var role in fromJsonModel.data!.roles!) {
      roles['roles']!.add(RoleToJsonModel.toJsonModel(role));
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
    role['retainers'] = [];
    for (var vRetainer in vRole.retainers!) {
      role['retainers'].add(RetainerToJsonModel.toJsonModel(vRetainer));
    }
  }
}

class RetainerToJsonModel {
  Map<String, String> retainer = {};

  RetainerToJsonModel();

  RetainerToJsonModel.toJsonModel(Retainer vRetainer) {
    retainer['retainerId'] = vRetainer.retainerId;
    retainer['retainerName'] = vRetainer.retainerName;
    retainer['retainerDesc'] = vRetainer.retainerDesc;
    retainer['lastDispatchTime'] = vRetainer.lastDispatchTime;
  }
}
