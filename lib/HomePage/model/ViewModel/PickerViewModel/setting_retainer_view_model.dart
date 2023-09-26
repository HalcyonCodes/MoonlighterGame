import 'dart:io';

import 'package:dio/dio.dart';
import '../../FromJsonModel/PickerFromJsonModel/setting_retainer_from_json_model.dart';

import '../../DataModel/PickerDataModel/setting_retainer_data.dart' as tdata;
import '../../ToJsonModel/PickerToJsonModel/setting_retainer_to_json_model.dart';

class SettingRetainerPickerViewModel {
  Response? response;

  SettingRetainerPickerModel? settingRetainerPickerModel;
  Map<String, dynamic>? postData;
  //test
  var dData = tdata.data;

  Future<int> refresh(String accountId) async {
    //test
    print(accountId);

    response = null;
    settingRetainerPickerModel = null;

    //发起http请求获得当前account数据
    response = await Dio().get('http://localhost:4040/');
    if (response!.statusCode == HttpStatus.ok) {
      //模拟加载数据
      settingRetainerPickerModel = SettingRetainerPickerModel.fromJson(dData);
      return response!.statusCode!;
    } else {
      return response!.statusCode!;
    }
  }

  //在列表里移除雇员
  Future<void> removeRetainerFromList(PickerRetainer retainer) async {
    settingRetainerPickerModel!.data!.retainers!.remove(retainer);
  }

  //在列表里添加雇员
  Future<void> insertRetainerToList(PickerRetainer retainer) async {
    settingRetainerPickerModel!.data!.retainers!.add(retainer);
  }

  //获取tojson
  void toJson() {
    postData = {};
    postData = SettingRetainerToJsonModel.toJsonModel(settingRetainerPickerModel!).retainers;
  }
}
