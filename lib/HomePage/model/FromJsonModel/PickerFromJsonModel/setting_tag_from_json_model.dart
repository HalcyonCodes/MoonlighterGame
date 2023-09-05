class SettingTagPickerModel {
  late String code;
  late String message;
  late SettingTagPickerData data;

  SettingTagPickerModel();

  SettingTagPickerModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = SettingTagPickerData.fromJson(json['data']);
  }
}


class SettingTagPickerData {
  late List<PickerTag> tags;

  SettingTagPickerData();

  SettingTagPickerData.fromJson(Map<String, dynamic> json) {
    tags = [];
    PickerTag? tag;
    json['tags'].forEach((v) {
      //tags.add(v);
      tag = PickerTag.fromJson(v);
      tags.add(tag!);
    });
  }
}

class PickerTag {
  late String tagName;
  late String tagId;
  late String tagTime;

  PickerTag();

  PickerTag.fromJson(Map<String, dynamic> json) {
    tagName = json['tagName'];
    tagId = json['tagId'];
    tagTime = json['tagTime'];
  }
}
