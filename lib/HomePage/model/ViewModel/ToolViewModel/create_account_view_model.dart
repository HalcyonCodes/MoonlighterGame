import 'package:dio/dio.dart';

class CreateAccountToolViewModel {
  Response? response;

  CreateAccountToolViewModel();

  //向服务器提交创建请求

  Future<int> createAccount(String accountId, String accountName) async {
    response = null;
    //response = await Dio().post("/account/create",data: {"accountId":accountId,"accountName":accountName});
    response = await Dio().get('http://localhost:4040/');

    return response!.statusCode!;
  }
}
