import 'dart:io';
import 'package:dio/dio.dart';
import '../../FromJsonModel/PickerFromJsonModel/setting_tag_from_json_model.dart';
import '../../DataModel/PickerDataModel/setting_tag_data.dart' as tdata;

class SettingTagPickerViewModel {
  Response? response;
  SettingTagPickerModel? settingTagPickerModel;

  SettingTagPickerViewModel();

  //test模拟加载数据
  var data = tdata.data;

  //向服务器提交
  Future<int> editAccount(String accountId, String accountName) async {
    response = null;
    //response = await Dio().post("/account/create",data: {"accountId":accountId,"accountName":accountName});
    response = await Dio().get('http://localhost:4040/');

    return response!.statusCode!;
  }

  //获取tags数据
  Future<int> refresh(String accountId) async {
    //test
    print(accountId);

    response = null;
    settingTagPickerModel = null;

    //发起http请求获得当前account数据
    response = await Dio().get('http://localhost:4040/');
    if (response!.statusCode == HttpStatus.ok) {
      //test
      settingTagPickerModel = SettingTagPickerModel.fromJson(data);

      return response!.statusCode!;
    } else {
      return response!.statusCode!;
    }
  }

  //向服务器发起添加tag请求
  Future<int> addTag(String tagName) async {
    response = null;

    //封装json
    Map<String, String> postData = {};
    postData['tagName'] = tagName;

    //发起post请求
    //response = await Dio().post("/account/create",data: {"accountId":accountId,"accountName":accountName});
    response = await Dio().get('http://localhost:4040/');

    //====test=====
    var newData = {
      'tagId': '456',
      'tagName': tagName,
      'tagTime': '2019/01/02',
    };
    // 获取 'tags' 数组
    data['data']!['tags'].add(newData);
    //====testEnd====

    return response!.statusCode!;
  }

  //向服务器发起删除标签请求
  Future<int> removeTag(String tagId) async {
    response = null;

    Map<String, String> postData = {};

    postData['tagId'] = tagId;

    //根据tagId发起post请求
    //response = await Dio().post("/account/create",data: {"accountId":accountId,"accountName":accountName});
    response = await Dio().get('http://localhost:4040/');


    //====test=====
    // 获取 'tags' 数组
    data['data']!['tags'].removeWhere((tag) => tag['tagId'] == tagId);
    //====testEnd====

    return response!.statusCode!;

  }
}
