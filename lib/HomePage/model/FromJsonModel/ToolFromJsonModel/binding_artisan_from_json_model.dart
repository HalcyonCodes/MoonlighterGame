class BindingArtisanToolModel {
  late String code;
  late String message;
  late BindingArtisanToolData data;

  BindingArtisanToolModel();

  BindingArtisanToolModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = BindingArtisanToolData.fromJson(json['data']);
  }
}

class BindingArtisanToolData {
  late List<Role> roles;

  BindingArtisanToolData();

  BindingArtisanToolData.fromJson(Map<String, dynamic> json) {
    roles = [];
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
  late String roleChannel;
  late List<Retainer> retainers;

  Role();

  Role.fromJson(Map<String, dynamic> json) {
    roleId = json['roleId'];
    roleName = json['roleName'];
    roleChannel = json['roleChannel'];
   
    if (json['retainers'] != null) {
      retainers = [];
      json['retainers'].forEach((v) {
        retainers.add(Retainer.fromJson(v));
      });
    }
  }
}

class Retainer {
  late String retainerId;
  late String retainerName;

  late Artisan artisan;

  Retainer();

  Retainer.fromJson(Map<String, dynamic> json) {
    retainerId = json['retainerId'];
    retainerName = json['retainerName'];

    if (json['artisan'] != null) {
      artisan = Artisan.fromJson(json['artisan']);
    }
  }
}

class Artisan {
  late String artisanId;
  late String artisanName;
  late String artisanChannel;
  late String artisanDesc;

  Artisan();

  Artisan.fromJson(Map<String, dynamic> json) {
    artisanId = json['artisanId'];
    artisanName = json['artisanName'];
    artisanChannel = json['artisanChannel'];
    artisanDesc = json['artisanDesc'];
  }
}
