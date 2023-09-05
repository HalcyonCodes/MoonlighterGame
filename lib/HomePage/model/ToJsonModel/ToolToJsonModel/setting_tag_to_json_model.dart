import '../../FromJsonModel/ToolFromJsonModel/setting_tag_from_json_model.dart';

class SettingTagToJsonModel {
  Map<String, List> tags = {};

  SettingTagToJsonModel.toJson(SettingTagToolModel tagFromJsonModel) {
    List<Tag> modelTags = tagFromJsonModel.data.tags;
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

  TagToJsonModel.toJson(Tag tagPara) {
    tag['tagId'] = tagPara.tagId;
    tag['tagName'] = tagPara.tagName;
    tag['tagTime'] = tagPara.tagTime;
  }
}
