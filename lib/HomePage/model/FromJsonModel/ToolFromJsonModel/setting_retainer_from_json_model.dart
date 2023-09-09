class SettingRetainerToolModel {
  String? code;
  String? message;
  SettingRetainerToolData? data;

  SettingRetainerToolModel();

  SettingRetainerToolModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if(json['data'] != null){
      data = SettingRetainerToolData.fromJson(json['data']);
    }
  }
}

class SettingRetainerToolData {
  List<Role>? roles;

  SettingRetainerToolData();

  SettingRetainerToolData.fromJson(Map<String, dynamic> json) {
    roles = [];
    if (json['roles'] != null) {
      json['roles'].forEach((v) {
        roles!.add(Role.fromJson(v));
      });
    }
  }
}

class Role {
  late String roleId;
  late String roleName;
  late String roleChannel;
  List<Retainer>? retainers;

  Role();

  Role.fromJson(Map<String, dynamic> json) {
    roleId = json['roleId'];
    roleName = json['roleName'];
    roleChannel = json['roleChannel'];
    retainers = [];
    if (json['retainers'] != null) {
      json['retainers'].forEach((v) {
        retainers!.add(Retainer.fromJson(v));
      });
    }
  }
}

class Retainer {
  late String retainerId;
  late String retainerName;
  late String lastDispatchTime;
  late String retainerDesc;

  Retainer();

  Retainer.fromJson(Map<String, dynamic> json) {
    retainerId = json['retainerId'];
    retainerName = json['retainerName'];
    lastDispatchTime = json['lastDispatchTime'];
    retainerDesc = json['retainerDesc'];
  }
}
