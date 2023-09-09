import 'dart:io';

import 'package:dio/dio.dart';
import '../../FromJsonModel/ToolFromJsonModel/setting_robot_from_json_model.dart';
import '../../DataModel/ToolDataModel/setting_robot_data.dart' as tdata;

class SettingRobotToolViewModel {
  Response? response;
  SettingRobotToolModel? settingRobotToolModel;

  //获取robots数据
  Future<int> refresh(String accountId) async {
    //test
    print(accountId);

    response = null;
    settingRobotToolModel = null;

    //发起http请求获得当前account数据
    response = await Dio().get('http://localhost:4040/');
    if (response!.statusCode == HttpStatus.ok) {
      //模拟加载数据
      var data = tdata.data;
      settingRobotToolModel = SettingRobotToolModel.fromJson(data);
      return response!.statusCode!;
    } else {
      return response!.statusCode!;
    }
  }

  //发起http请求修改绑定机器人
  Future<int> updateRobot() async {
    response = null;
    String robotId;

    if (settingRobotToolModel!.data.robots!.isEmpty) {
      robotId = 'null';
    } else {
      robotId = settingRobotToolModel!.data.robots![0].robotId;
    }

    //发起post请求通过robotId修改绑定机器人
    response = await Dio().get('http://localhost:4040/');

    return response!.statusCode!;
  }

  //移除viewModel里的机器人item
  void removModelItem(int index) {
    settingRobotToolModel!.data.robots!.removeAt(index);
  }

  //添加机器人
  void addRobot() {
    
  }
}
