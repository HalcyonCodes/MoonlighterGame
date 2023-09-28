import 'dart:io';

import 'package:dio/dio.dart';
import '../../FromJsonModel/ToolFromJsonModel/setting_channel_from_json_model.dart';
import '../../ToJsonModel/ToolToJsonModel/setting_channel_to_json_model.dart';

//test
import '../../DataModel/ToolDataModel/setting_channel_data.dart' as tdata;

class SettingChannelToolViewModel {
  Response? response;
  SettingChannelToolModel? settingChannelToolModel;
  Map<String, dynamic>? postData;
  //test
  var data = tdata.data;

  //获取所有retainer数据
  Future<int> refresh(String accountId) async {
    //test
    print(accountId);

    response = null;
    settingChannelToolModel = null;

    //发起http请求获得当前account数据
    response = await Dio().get('http://localhost:4040/');
    if (response!.statusCode == HttpStatus.ok) {
      //模拟加载数据
      settingChannelToolModel = SettingChannelToolModel.fromJson(data);
      return response!.statusCode!;
    } else {
      return response!.statusCode!;
    }
  }

  void switchItem(Channel sourceChannel, Channel targetChannel) {
    int sourceIndex =
        settingChannelToolModel!.data.channels.indexWhere((element) {
      return element.channelName == sourceChannel.channelName &&
          element.channelClassName == sourceChannel.channelClassName;
    });
    int targetIndex =
        settingChannelToolModel!.data.channels.indexWhere((element) {
      return element.channelName == targetChannel.channelName &&
          element.channelClassName == targetChannel.channelClassName;
    });

    settingChannelToolModel!.data.channels[sourceIndex] = targetChannel;
    settingChannelToolModel!.data.channels[targetIndex] = sourceChannel;
  }

  void removeItem(Channel channel) {
    settingChannelToolModel!.data.channels.remove(channel);
  }

  void addItem(Channel channel) {
    settingChannelToolModel!.data.channels.add(channel);
  }

  //提交更新
  Future<int> updateChannel() async {
    response = null;
    postData = {};

    postData = SettingChannelToJsonModel.toJsonModel(settingChannelToolModel!).channels;

    //根据postData发起post请求修改数据
    response = await Dio().get('http://localhost:4040/');
    
    return response!.statusCode!;

  }
}
