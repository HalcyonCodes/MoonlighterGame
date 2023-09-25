import '../../FromJsonModel/ToolFromJsonModel/setting_role_from_json_model.dart';

class SettingRoleToJsonModel {
  Map<String, dynamic> channels = {};

  SettingRoleToJsonModel();

  SettingRoleToJsonModel.toJsonModel(SettingRoleToolModel vModel) {
    channels['channels'] = [];
    for (var element in vModel.data.channels) {
      channels['channels'].add(ChannelToJsonModel.toJsonModel(element));
    }
  }
}

class ChannelToJsonModel {
  Map<String, dynamic> channel = {};

  ChannelToJsonModel();

  ChannelToJsonModel.toJsonModel(Channel vChannel) {
    channel['channelId'] = vChannel.channelId;
    channel['channelName'] = vChannel.channelName;
    channel['channelRoleCount'] = vChannel.channelRoleCount;
    channel['roles'] = [];
    for (var element in vChannel.roles) {
      channel['roles'].add(RoleToJsonModel.toJsonModel(element));
    }
  }
}

class RoleToJsonModel {
  Map<String, String> role = {};

  RoleToJsonModel();

  RoleToJsonModel.toJsonModel(Role vRole) {
    role['roleId'] = vRole.roleId;
    role['roleName'] = vRole.roleName;
    role['roleDesc'] = vRole.roleDesc;
    role['roleCategory'] = vRole.roleCategory;
  }
}
