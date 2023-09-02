class ListTerimalModel {
  late String code;
  late String message;
  late ListData data;


  ListTerimalModel();

  ListTerimalModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = ListData.fromJson(json['data']);
  }
}

class ListData {
  late List<Terimal> terimals;


  ListData();

  ListData.fromJson(Map<String, dynamic> json) {
    terimals = [];
    json['terimals'].forEach((terimal) {
      terimals.add(Terimal.fromJson(terimal));
    });
  }
}

class Terimal {
  late String terimalId;
  late String terimalName;
  late String terimalCategory;
  late String terimalCreateTime;
  late List<String> terimalTags;
  late String terimalStatus;

  Terimal();

  Terimal.fromJson(Map<String, dynamic> json) {
    terimalId = json['id'];
    terimalName = json['name'];
    terimalCategory = json['category'];
    terimalCreateTime = json['createTime'];
    terimalTags = json['tags'].cast<String>();
    terimalStatus = json['status'];
  }
}
