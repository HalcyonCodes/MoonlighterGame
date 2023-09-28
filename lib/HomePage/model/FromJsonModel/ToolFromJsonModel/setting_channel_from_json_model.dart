class SettingChannelToolModel {
  late String code;
  late String message;
  late SettingChannelToolData data;

  SettingChannelToolModel();

  SettingChannelToolModel.fromJson(Map<String, dynamic> json){
    code = json['code'];
    message = json['message'];
    if(json['data'] != null){
      data = SettingChannelToolData.fromJson(json['data']);
    }
  }

}

class SettingChannelToolData {
  late List<Channel> channels;

  SettingChannelToolData();
  SettingChannelToolData.fromJson(Map<String, dynamic> json) {
    channels = [];
    if (json['channels'] != null) {
      json['channels'].forEach((v) => channels.add(Channel.fromJson(v)));
    }
  }
}

class Channel {
  late String channelId;
  late String channelName;
  late String channelClassName;

  Channel();

  Channel.fromJson(Map<String, dynamic> json) {
    channelId = json['channelId'];
    channelName = json['channelName'];
    channelClassName = json['channelClassName'];
  }
}
