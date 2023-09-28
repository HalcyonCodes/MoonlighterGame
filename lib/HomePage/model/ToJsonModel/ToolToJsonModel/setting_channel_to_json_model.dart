import '../../FromJsonModel/ToolFromJsonModel/setting_channel_from_json_model.dart';

class SettingChannelToJsonModel {
  Map<String, List> channels = {};

  SettingChannelToJsonModel();

  SettingChannelToJsonModel.toJsonModel(SettingChannelToolModel fromJsonModel) {
    channels['channels'] = [];
    for(var vChannel in fromJsonModel.data.channels){
      channels['channels']!.add(ChannelToJsonModel.toJsonModel(vChannel));
    }
  }
}



class ChannelToJsonModel {
  Map<String, String> channel = {};

  ChannelToJsonModel();

  ChannelToJsonModel.toJsonModel(Channel vChannel) {
    channel['channelId'] = vChannel.channelId;
    channel['channelName'] = vChannel.channelName;
    channel['channelClassName'] = vChannel.channelClassName;
  }
}
