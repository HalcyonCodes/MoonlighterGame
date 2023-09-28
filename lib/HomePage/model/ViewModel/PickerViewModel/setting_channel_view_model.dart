import 'dart:io';

import 'package:dio/dio.dart';
import '../../FromJsonModel/PickerFromJsonModel/setting_channel_from_json_model.dart';
//test
import '../../DataModel/PickerDataModel/setting_channel_data.dart' as tdata;

class SettingChannelPickerViewModel {
  Response? response;
  SettingChannelPickerModel? settingChannelPickerModel;

  //test
  var data = tdata.data;

  //获取所有retainer数据
  Future<int> refresh() async {
    response = null;
    settingChannelPickerModel = null;

    //发起http请求获得当前account数据
    response = await Dio().get('http://localhost:4040/');
    if (response!.statusCode == HttpStatus.ok) {
      //模拟加载数据
      settingChannelPickerModel = SettingChannelPickerModel.fromJson(data);
      return response!.statusCode!;
    } else {
      return response!.statusCode!;
    }
  }

  Future<int> removeItem(PickerChannel channel) async {
    response = null;

    Map<String, String> postData = {};
    postData['channelId'] = channel.channelId;
    postData['channelName'] = channel.channelName;
    postData['channelClassName'] = channel.channelClassName;

    //通过post请求发起post请求删除数据
    response = await Dio().get('http://localhost:4040/');
    
    return response!.statusCode!;
  }

  void addItem(PickerChannel channel) {
    settingChannelPickerModel!.data.channels.add(channel);
  }
}
