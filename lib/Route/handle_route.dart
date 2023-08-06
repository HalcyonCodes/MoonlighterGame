import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

//----页面-----
import '../HomePage/home_page.dart';

//---
Handler homePageHandle = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return HomePage();
});