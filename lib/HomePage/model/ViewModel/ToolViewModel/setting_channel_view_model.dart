import 'dart:io';

import 'package:dio/dio.dart';
import '../../FromJsonModel/ToolFromJsonModel/setting_channel_from_json_model.dart';

//test
import '../../DataModel/ToolDataModel/setting_channel_data.dart' as tdata;

class SettingChannelToolViewModel {
  Response? response;
  SettingChannelToolModel? settingChannelToolModel;

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
    int sourceIndex = settingChannelToolModel!.data.channels
        .indexWhere((element) => element.channelName == sourceChannel.channelName && element.channelClassName == sourceChannel.channelClassName);
    int targetIndex = settingChannelToolModel!.data.channels
        .indexWhere((element) => element.channelName == sourceChannel.channelName && element.channelClassName == sourceChannel.channelClassName);

    settingChannelToolModel!.data.channels[sourceIndex] = targetChannel;
    settingChannelToolModel!.data.channels[targetIndex] = sourceChannel;
  }

  void removeItem(Channel channel) {
    settingChannelToolModel!.data.channels.remove(channel);
  }
}
