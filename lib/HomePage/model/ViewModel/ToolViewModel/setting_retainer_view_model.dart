import 'dart:io';

import 'package:dio/dio.dart';
import '../../FromJsonModel/ToolFromJsonModel/setting_retainer_from_json_model.dart';
import '../../ToJsonModel/ToolToJsonModel/setting_retainer_to_json_model.dart';

//test
import '../../DataModel/ToolDataModel/setting_retainer_data.dart' as tdata;

class SettingRetainerViewModel {
  Response? response;
  SettingRetainerToolModel? settingRetainerToolModel;
  Map<String, dynamic>? postData;

  //获取所有retainer数据
  Future<int> refresh(String accountId) async {
    //test
    print(accountId);

    response = null;
    settingRetainerToolModel = null;

    //发起http请求获得当前account数据
    response = await Dio().get('http://localhost:4040/');
    if (response!.statusCode == HttpStatus.ok) {
      //模拟加载数据
      var data = tdata.data;
      settingRetainerToolModel = SettingRetainerToolModel.fromJson(data);
      return response!.statusCode!;
    } else {
      return response!.statusCode!;
    }
  }

  //提交修改
  Future<int> updateRetainer(Map<String, dynamic> posData) async {
    response = null;

    //发起post请求提交修改
    response = await Dio().get('http://localhost:4040/');

    return response!.statusCode!;
  }

  //移除retainer
  void removeRetainer(Role role, int index) {
    role.retainers!.removeAt(index);
  }

  //向上移动retainer
  void moveUpRetainer(Role role, int index) {
    role.retainers!.insert(index - 1, role.retainers![index]);
    role.retainers!.removeAt(index + 1);
  }

  //向下移动retainer
  void moveDownRetainer(Role role, int index) {
    Retainer temp = role.retainers![index];
    role.retainers!.removeAt(index);
    role.retainers!.insert(index + 1, temp);
  }

  //插入雇员
  void insertRetainer(Role role, Retainer retainer) {
    role.retainers!.add(retainer);
  }

  void toJson() {
    postData = {};
    postData = SettingRetainerToJsonModel.toJsonModel(settingRetainerToolModel!).roles;
  }
}
