import 'dart:io';

import 'package:dio/dio.dart';

import '../../FromJsonModel/ToolFromJsonModel/setting_role_from_json_model.dart';
import '../../DataModel/ToolDataModel/setting_role_data.dart' as tdata;
import '../../ToJsonModel/ToolToJsonModel/setting_role_to_json_model.dart';

class SettingRoleToolViewModel {
  Response? response;
  SettingRoleToolModel? settingRoleToolModel;
  Map<String, dynamic>? postData;

  //获取robots数据
  Future<int> refresh(String accountId) async {
    //test
    print(accountId);

    response = null;
    settingRoleToolModel = null;

    //发起http请求获得当前account数据
    response = await Dio().get('http://localhost:4040/');
    if (response!.statusCode == HttpStatus.ok) {
      //模拟加载数据
      var data = tdata.data;
      settingRoleToolModel = SettingRoleToolModel.fromJson(data);
      return response!.statusCode!;
    } else {
      return response!.statusCode!;
    }
  }

  void switchRole(Channel sourceChannel, Role sourceRole, Role targetRole) {
    int sourceIndex = sourceChannel.roles.indexWhere((e) => e == sourceRole);
    int targetIndex = sourceChannel.roles.indexWhere((e) => e == targetRole);
    sourceChannel.roles[sourceIndex] = targetRole;
    sourceChannel.roles[targetIndex] = sourceRole;
  }

  void removeRole(Channel channel, Role role) {
    channel.roles.remove(role);
  }

  void insertRole(Channel channel, Role role) {
    channel.roles.add(role);
  }

  void toJson() {
    postData = SettingRoleToJsonModel.toJsonModel(settingRoleToolModel!).channels;
  }

  Future<int> updateRole(Map<String, dynamic> vData) async {
    //根据postData发起post请求
    response = await Dio().get('http://localhost:4040/');
    return response!.statusCode!;
  }
}
