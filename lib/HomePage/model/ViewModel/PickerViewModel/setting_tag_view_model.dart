import 'dart:io';
import 'package:dio/dio.dart';
import '../../FromJsonModel/PickerFromJsonModel/setting_tag_from_json_model.dart';
import '../../DataModel/PickerDataModel/setting_tag_data.dart' as tdata;
import 'package:intl/intl.dart';
import '../../ToJsonModel/PickerToJsonModel/setting_tag_to_json_model.dart';


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

  //加tag
  void addTag(String tagName) {
    PickerTag tag = PickerTag();
    tag.tagName = tagName;
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy/M/d').format(now);
    tag.tagTime = formattedDate;
    tag.tagId = '';
    settingTagPickerModel!.data.tags.add(tag);

  }

  //删除标签请求
  void removeTag(String tagId) {
    PickerTag tag =  settingTagPickerModel!.data.tags.where((element) => element.tagId == tagId).first;
    settingTagPickerModel!.data.tags.remove(tag);
  }

    Map<String, dynamic> toJson() {
    return SettingTagToJsonModel.toJson(settingTagPickerModel!).tags;
  }
}
