

class SettingChannelPickerModel {
  late String code;
  late String message;
  late SettingChannelPickerData data;

  SettingChannelPickerModel();

  SettingChannelPickerModel.fromJson(Map<String, dynamic> json){
    code = json['code'];
    message = json['message'];
    if(json['data'] != null){
      data = SettingChannelPickerData.fromJson(json['data']);
    }
  }

}

class SettingChannelPickerData {
  late List<PickerChannel> channels;

  SettingChannelPickerData();
  SettingChannelPickerData.fromJson(Map<String, dynamic> json) {
    channels = [];
    if (json['channels'] != null) {
      json['channels'].forEach((v) => channels.add(PickerChannel.fromJson(v)));
    }
  }
}

class PickerChannel {
  late String channelId;
  late String channelName;
  late String channelClassName;

  PickerChannel();

  PickerChannel.fromJson(Map<String, dynamic> json) {
    channelId = json['channelId'];
    channelName = json['channelName'];
    channelClassName = json['channelClassName'];
  }
}
