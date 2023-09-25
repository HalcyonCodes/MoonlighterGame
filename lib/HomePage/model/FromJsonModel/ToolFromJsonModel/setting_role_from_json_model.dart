class SettingRoleToolModel {
  late String code;
  late String message;
  late SettingRoleToolData data;

  SettingRoleToolModel();

  SettingRoleToolModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = SettingRoleToolData.fromJson(json['data']);
    }
  }
}

class SettingRoleToolData {
  late List<Channel> channels;
 

  SettingRoleToolData();

  SettingRoleToolData.fromJson(Map<String, dynamic> json) {
    channels = [];
  
    if (json['channels'] != null) {
      
      json['channels'].forEach((v) {
        channels.add(Channel.fromJson(v));
      });
    }
  }
}

class Channel {
  late List<Role> roles;
   late String channelName;
  late String channelId;
  late String channelRoleCount;

  Channel();

  Channel.fromJson(Map<String, dynamic> json) {
    roles = [];
    channelName = json['channelName'];
    channelId = json['channelId'];
    channelRoleCount = json['channelRoleCount'];
    if (json['roles'] != null) {
      json['roles'].forEach((v) {
        roles.add(Role.fromJson(v));
      });
    }
  }
}

class Role {
  late String roleId;
  late String roleName;
  late String roleCategory;
  late String roleDesc;

  Role();

  Role.fromJson(Map<String, dynamic> json) {
    roleId = json['roleId'];
    roleName = json['roleName'];
    roleCategory = json['roleCategory'];
    roleDesc = json['roleDesc'];
  }
}
