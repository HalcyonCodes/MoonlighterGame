class SettingTagToolModel {
  late String code;
  late String message;
  late SettingTagToolData data;

  SettingTagToolModel();

  SettingTagToolModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = SettingTagToolData.fromJson(json['data']);
  }
}

class SettingTagToolData {
  late List<Tag> tags;

  SettingTagToolData();

  SettingTagToolData.fromJson(Map<String, dynamic> json) {
    tags = [];
    Tag? tag;
    json['tags'].forEach((v) {
      //tags.add(v);
      tag = Tag.fromJson(v);
      tags.add(tag!);
    });
  }
}

class Tag {
  late String tagName;
  late String tagId;
  late String tagTime;

  Tag();

  Tag.fromJson(Map<String, dynamic> json) {
    tagName = json['tagName'];
    tagId = json['tagId'];
    tagTime = json['tagTime'];
  }
}
