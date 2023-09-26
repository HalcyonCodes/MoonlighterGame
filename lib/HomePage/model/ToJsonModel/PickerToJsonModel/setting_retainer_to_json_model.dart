import '../../FromJsonModel/PickerFromJsonModel/setting_retainer_from_json_model.dart';

class SettingRetainerToJsonModel {
  Map<String, dynamic> retainers = {};

  SettingRetainerToJsonModel();

  SettingRetainerToJsonModel.toJsonModel(SettingRetainerPickerModel vModel) {
    retainers['retainers'] = [];
    for (var element in vModel.data!.retainers!) {
      retainers['retainers'].add(RetainerToJson.toJsonModel(element));
    }
  }
}

class RetainerToJson {
  Map<String, dynamic> retainer = {};

  RetainerToJson();

  RetainerToJson.toJsonModel(PickerRetainer vRetainer) {
    retainer['retainerId'] = vRetainer.retainerId;
    retainer['retainerName'] = vRetainer.retainerName;
    retainer['lastDispatchTime'] = vRetainer.lastDispatchTime;
    retainer['retainerDesc'] = vRetainer.retainerDesc;
  }
}
