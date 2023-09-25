import 'dart:io';

import 'package:dio/dio.dart';
import '../../DataModel/ToolDataModel/setting_tag_data.dart' as tdata;
import '../../FromJsonModel/ToolFromJsonModel/setting_tag_from_json_model.dart';
import '../../ToJsonModel/ToolToJsonModel/setting_tag_to_json_model.dart';


class SettingTagToolViewModel {
  Response? response;
  SettingTagToolModel? settingTagToolModel;

  SettingTagToolViewModel();

  //获取tags数据
  Future<int> refresh(String accountId) async {
    //test
    print(accountId);

    response = null;
    settingTagToolModel = null;

    //发起http请求获得当前account数据
    response = await Dio().get('http://localhost:4040/');
    if (response!.statusCode == HttpStatus.ok) {
      //模拟加载数据
      var data = tdata.data;
      settingTagToolModel = SettingTagToolModel.fromJson(data);
      return response!.statusCode!;
    } else {
      return response!.statusCode!;
    }
  }

  //向服务器发起修改tags请求
  Future<int> changeTags(Map<String, dynamic> postData) async {
    response = null;

    //封装json
    //var postData = SettingTagToJsonModel.toJson(settingTagToolModel!);

    //发起post请求
    //response = await Dio().post("/account/create",data: {"accountId":accountId,"accountName":accountName});
    response = await Dio().get('http://localhost:4040/');

    return response!.statusCode!;
  }

  //向viewModel删除标签
  void removeTag(Tag tag) {
    settingTagToolModel!.data.tags.remove(tag);
  }

  //向viewModel添加标签
  void addTag(Tag tag) {
    settingTagToolModel!.data.tags.add(tag);
  }

   Map<String, dynamic> toJson() {
    return SettingTagToJsonModel.toJson(settingTagToolModel!).tags;
  }

}
