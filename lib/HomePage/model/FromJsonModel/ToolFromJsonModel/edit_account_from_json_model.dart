class EditAccountToolModel {
  late String code;
  late String message;
  late EditAccountToolData data;

  EditAccountToolModel();

  EditAccountToolModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = EditAccountToolData.fromJson(json['data']);
  }
}

class EditAccountToolData {
  late String accountId;
  late String accountName;

  EditAccountToolData();

  EditAccountToolData.fromJson(Map<String, dynamic> json) {
    accountId = json['accountId'];
    accountName = json['accountName'];
  }
}
