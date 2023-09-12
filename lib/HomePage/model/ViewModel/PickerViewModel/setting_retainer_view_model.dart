import 'dart:io';

import 'package:dio/dio.dart';
import '../../FromJsonModel/PickerFromJsonModel/setting_retainer_from_json_model.dart';

import '../../DataModel/PickerDataModel/setting_retainer_data.dart' as tdata;

class SettingRetainerPickerViewModel {
  Response? response;

  SettingRetainerPickerModel? settingRetainerPickerModel;

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

  //向服务器添加雇员
  Future<int> addRetainer(
      String retainerId, String retainerName, String retainerDesc) async {
    response = null;
    Map<String, String> postData = {};
    postData['retainerId'] = retainerId;
    postData['retainerName'] = retainerName;
    postData['lastDispatchTime'] = '1992/9/4';
    postData['retainerDesc'] = retainerDesc;

    //通过data发起post请求
    //Dio().post('http://localhost:4040/', data: postData);
    response = await Dio().get('http://localhost:4040/');

    //====test====
    dData['data']['retainers'].add(postData);
    //====后期需要删除===

    return response!.statusCode!;
  }

  //移除雇员
  Future<int> removeRetainer(String retainerId) async {
    response = null;
    Map<String, String> postData = {};
    postData['retainerId'] = retainerId;

    //通过data发起post请求
    //Dio().post('http://localhost:4040/', data: postData);
    response = await Dio().get('http://localhost:4040/');

    //====test====
    dData['data']['retainers']
        .removeWhere((element) => element['retainerId'] == retainerId);
    //====后期需要删除===

    return response!.statusCode!;
  }

  //在列表里移除雇员
  Future<void> removeRetainerFromList(PickerRetainer retainer) async {
    settingRetainerPickerModel!.data!.retainers!.remove(retainer);
  }

  //在列表里添加雇员
  Future<void> insertRetainerToList(PickerRetainer retainer) async {
    settingRetainerPickerModel!.data!.retainers!.add(retainer);
  }
}
