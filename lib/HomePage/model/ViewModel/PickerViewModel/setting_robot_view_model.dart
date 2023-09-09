import 'dart:io';

import 'package:dio/dio.dart';
import '../../FromJsonModel/PickerFromJsonModel/setting_robot_from_json_model.dart';

import '../../DataModel/PickerDataModel/setting_robot_data.dart' as tdata;

class SettingRobotPickerViewModel {
  Response? response;
  SettingRobotPickerModel? settingRobotPickerModel;

  //获取所有robots数据
  Future<int> refresh() async {

    response = null;
    settingRobotPickerModel = null;

    //发起http请求获得当前account数据
    response = await Dio().get('http://localhost:4040/');
    if (response!.statusCode == HttpStatus.ok) {
      //模拟加载数据
      var data = tdata.data;
      settingRobotPickerModel = SettingRobotPickerModel.fromJson(data);
      return response!.statusCode!;
    } else {
      return response!.statusCode!;
    }
  }




}
