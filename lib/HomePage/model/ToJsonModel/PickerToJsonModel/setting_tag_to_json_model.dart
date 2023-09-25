import '../../FromJsonModel/PickerFromJsonModel/setting_tag_from_json_model.dart';

class SettingTagToJsonModel {
  Map<String, List> tags = {};

  SettingTagToJsonModel.toJson(SettingTagPickerModel tagFromJsonModel) {
    List<PickerTag> modelTags = tagFromJsonModel.data.tags;
    tags['tags'] = [];
    TagToJsonModel? temp;
    for (var element in modelTags) {
      temp = TagToJsonModel.toJson(element);
      tags['tags']!.add(temp);
    }
  }
}

class TagToJsonModel {
  Map<String, String> tag = {};

  TagToJsonModel.toJson(PickerTag tagPara) {
    tag['tagId'] = tagPara.tagId;
    tag['tagName'] = tagPara.tagName;
    tag['tagTime'] = tagPara.tagTime;
  }
}
