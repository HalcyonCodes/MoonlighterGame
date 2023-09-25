import 'dart:io';

import 'package:dio/dio.dart';
import '../../FromJsonModel/PickerFromJsonModel/setting_role_from_json_model.dart';
import '../../ToJsonModel/PickerToJsonModel/setting_role_to_json_model.dart';
import '../../DataModel/PickerDataModel/setting_role_data.dart' as tdata;

class SettingRolePickerViewModel {
  Response? response;
  SettingRolePickerModel? settingRolePickerModel;
  Map<String, dynamic>? postMap;

  var data = tdata.data;

  //获取所有roles数据
  Future<int> refresh() async {
    response = null;
    settingRolePickerModel = null;

    //发起http请求获得当前account数据
    response = await Dio().get('http://localhost:4040/');
    if (response!.statusCode == HttpStatus.ok) {
      //模拟加载数据

      settingRolePickerModel = SettingRolePickerModel.fromJson(data);
      return response!.statusCode!;
    } else {
      return response!.statusCode!;
    }
  }

  //移除role
  void removeRole(PickerRole role) {
    settingRolePickerModel!.data.roles.remove(role);
  }

  //添加role
  void insertRole(PickerRole role) {
    settingRolePickerModel!.data.roles.add(role);
  }

  //返回Post数据
  void toJson() {
    postMap = {};
    postMap = SettingRoleToJsonModel.toJsonModel(settingRolePickerModel!).roles;
  }
}
