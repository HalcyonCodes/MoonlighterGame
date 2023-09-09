class SettingRobotPickerModel {
  late String code;
  late String message;
  late SettingRobotPickerData data;

  SettingRobotPickerModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = SettingRobotPickerData.fromJson(json['data']);
  }
}

class SettingRobotPickerData {
  List<PickerRobot>? robots;
  SettingRobotPickerData.fromJson(Map<String, dynamic> json) {
    robots = [];
    PickerRobot temp;
    json['robots'].forEach((v) {
      temp = PickerRobot.fromJson(v);
      robots!.add(temp);
    });
  }
}

class PickerRobot {
  late String robotId;
  late String robotName;
  late String robotCreateDate;
  late String robotProfile;
  late String bidingCount;
  late String scriptCount;

  PickerRobot();

  PickerRobot.fromJson(Map<String, dynamic> json) {
    robotId = json['robotId'];
    robotName = json['robotName'];
    robotCreateDate = json['robotCreateDate'];
    robotProfile = json['robotProfile'];
    bidingCount = json['bidingCount'];
    scriptCount = json['scriptCount'];
  }
}
