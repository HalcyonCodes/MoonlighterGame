class SettingRobotToolModel {
  late String code;
  late String message;
  late SettingRobotToolData data;

  SettingRobotToolModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = SettingRobotToolData.fromJson(json['data']);
  }
}

class SettingRobotToolData {
  List<Robot>? robots;
  SettingRobotToolData.fromJson(Map<String, dynamic> json) {
    robots = [];
    Robot temp;
    json['robots'].forEach((v) {
      temp = Robot.fromJson(v);
      robots!.add(temp);
    });
  }
}

class Robot {
  late String robotId;
  late String robotName;
  late String robotCreateDate;
  late String robotProfile;
  late String bidingCount;
  late String scriptCount;

  Robot();

  Robot.fromJson(Map<String, dynamic> json) {
    robotId = json['robotId'];
    robotName = json['robotName'];
    robotCreateDate = json['robotCreateDate'];
    robotProfile = json['robotProfile'];
    bidingCount = json['bidingCount'];
    scriptCount = json['scriptCount'];
  }
}
