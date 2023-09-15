import '../../FromJsonModel/ToolFromJsonModel/binding_artisan_from_json_model.dart';

class BindingArtisanToJsonModel {
  Map<String, List> roles = {};

  BindingArtisanToJsonModel();

  BindingArtisanToJsonModel.toJsonModel(BindingArtisanToolModel fromJsonModel) {
    print('ddd');
    roles['roles'] = [];
    for (var role in fromJsonModel.data.roles) {
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
    for (var vRetainer in vRole.retainers) {
      role['retainers'].add(RetainerToJsonModel.toJsonModel(vRetainer));
    }
  }
}

class RetainerToJsonModel {
  Map<String, dynamic> retainer = {};

  RetainerToJsonModel();

  RetainerToJsonModel.toJsonModel(Retainer vRetainer) {
    retainer['retainerId'] = vRetainer.retainerId;
    retainer['retainerName'] = vRetainer.retainerName;
    retainer['artisan'] = ArtisanToJsonModel.toJsonModel(vRetainer.artisan);
  }
}

class ArtisanToJsonModel {
  Map<String, dynamic> artisan = {};

  ArtisanToJsonModel();

  ArtisanToJsonModel.toJsonModel(Artisan vArtisan) {
    artisan['artisanId'] = vArtisan.artisanId;
    artisan['artisanName'] = vArtisan.artisanName;
    artisan['artisanDesc'] = vArtisan.artisanDesc;
    artisan['artisanChannel'] = vArtisan.artisanChannel;
  }
}
