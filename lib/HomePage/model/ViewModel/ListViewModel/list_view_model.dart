import 'dart:io';

import 'package:dio/dio.dart';
import '../../FromJsonModel/ListFromJsonModel/list_from_json_model.dart';
//测试数据
import '../../DataModel/ListDataModel/list_data.dart' as data;

class ListViewModel {
  Response? response;
  ListTerimalModel? listTerimalModel;

  ListViewModel();

  Future<int> refresh() async {
    listTerimalModel = null;
    response = null;

    //http请求，需要换成api
    response = await Dio().get('http://localhost:4040/');

    if (response!.statusCode == HttpStatus.ok) {
      //模拟加载数据
      var testData = data.data;
      //解析
      listTerimalModel = ListTerimalModel();
      listTerimalModel = ListTerimalModel.fromJson(testData);
      return response!.statusCode!;
    } else {
      return response!.statusCode!;
    }
  }

  Future<int> searchWithTag(String tag) async {
    //test
    print('tag');

    listTerimalModel = null;
    response = null;

    //通过tag发起http请求
    response = await Dio().get('http://localhost:4040/');

    if (response!.statusCode == HttpStatus.ok) {
      //模拟加载数据
      var testData = data.data;
      //解析
      listTerimalModel = ListTerimalModel();
      listTerimalModel = ListTerimalModel.fromJson(testData);
      return response!.statusCode!;
    } else {
      return response!.statusCode!;
    }
  }

  Future<int> searchWithName(String name) async {
    //test
    print('name');

    listTerimalModel = null;
    response = null;

    //通过name发起http请求
    response = await Dio().get('http://localhost:4040/');

    if (response!.statusCode == HttpStatus.ok) {
      //模拟加载数据
      var testData = data.data;
      //解析
      listTerimalModel = ListTerimalModel();
      listTerimalModel = ListTerimalModel.fromJson(testData);
      return response!.statusCode!;
    } else {
      return response!.statusCode!;
    }
  }

  Future<int> searchWithId(String name) async {
    
    //test
    print('Id');

    listTerimalModel = null;
    response = null;

    //通过Id发起http请求
    response = await Dio().get('http://localhost:4040/');

    if (response!.statusCode == HttpStatus.ok) {
      //模拟加载数据
      var testData = data.data;
      //解析
      listTerimalModel = ListTerimalModel();
      listTerimalModel = ListTerimalModel.fromJson(testData);
      return response!.statusCode!;
    } else {
      return response!.statusCode!;
    }
  }

  //设置终端的状态
  Future<int> setTerimalStatus(String id, String status) async {
    
    //test
    print('terimalStatus : ${id}, ${status}');

    listTerimalModel = null;
    response = null;

    //通过Id发起http请求，设置终端状态
    response = await Dio().get('http://localhost:4040/');

    if (response!.statusCode == HttpStatus.ok) {
      //模拟加载数据
      var testData = data.data;
      //解析
      listTerimalModel = ListTerimalModel();
      listTerimalModel = ListTerimalModel.fromJson(testData);
      return response!.statusCode!;
    } else {
      return response!.statusCode!;
    }
  }


}
