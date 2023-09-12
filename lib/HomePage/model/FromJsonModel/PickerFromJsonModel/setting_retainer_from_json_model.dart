class SettingRetainerPickerModel {
  String? code;
  String? message;
  SettingRetainerPickerData? data;

  SettingRetainerPickerModel();

  SettingRetainerPickerModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if(json['data'] != null){
      data = SettingRetainerPickerData.fromJson(json['data']);
    }
  }
}



class SettingRetainerPickerData {

  List<PickerRetainer>? retainers;

  SettingRetainerPickerData();

  SettingRetainerPickerData.fromJson(Map<String, dynamic> json) {
    retainers = [];
    if (json['retainers'] != null) {
      json['retainers'].forEach((v) {
        retainers!.add(PickerRetainer.fromJson(v));
      });
    }
  }
}

class PickerRetainer {
  late String retainerId;
  late String retainerName;
  late String lastDispatchTime;
  late String retainerDesc;

  PickerRetainer();

  PickerRetainer.fromJson(Map<String, dynamic> json) {
    retainerId = json['retainerId'];
    retainerName = json['retainerName'];
    lastDispatchTime = json['lastDispatchTime'];
    retainerDesc = json['retainerDesc'];
  }
}
