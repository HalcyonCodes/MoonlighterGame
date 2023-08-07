import 'package:flutter/material.dart';
import './color.dart';

class KFont {
  //searchBar中搜索栏字体
  static TextStyle searchBarStyle = const TextStyle(
    fontFamily: 'MiSans',
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: Colors.black,
    decoration: TextDecoration.none,
    //height:
  );

  //searchBar中搜索栏初始化字体
  static TextStyle searchBarInitStyle = TextStyle(
    fontFamily: 'MiSans',
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: KColor.greyTextColor,
    decoration: TextDecoration.none,
    //height:
  );

  //searchBar中切换搜索按钮的字体
  static TextStyle searchBarButtonStyle = const TextStyle(
      fontFamily: 'MiSans',
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: Colors.white,
      decoration: TextDecoration.none,
      height: 26 / 18);

  //card中次级信息字体
  static TextStyle cardProfileStyle = TextStyle(
      fontFamily: 'MiSans',
      fontSize: 13,
      fontWeight: FontWeight.w500,
      color: KColor.greyTextColor,
      decoration: TextDecoration.none,
      height: 17 / 13);

  //选中卡片时card中次级信息字体
  static TextStyle cardProfileSelectedStyle = const TextStyle(
      fontFamily: 'MiSans',
      fontSize: 13,
      fontWeight: FontWeight.w500,
      color: Colors.white,
      decoration: TextDecoration.none,
      height: 17 / 13);

  //卡片标题字体
  static TextStyle cardTitleStyle = const TextStyle(
      fontFamily: 'MiSans',
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.black,
      decoration: TextDecoration.none,
      height: 25 / 18);

  //卡片标题字体选中状态
  static TextStyle cardTitleSelectedStyle = const TextStyle(
      fontFamily: 'MiSans',
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.white,
      decoration: TextDecoration.none,
      height: 25 / 18);
    
  //卡片标签字体
  static TextStyle tagStyle = const TextStyle(
      fontFamily: 'MiSans',
      fontSize: 13,
      fontWeight: FontWeight.w500,
      color: Colors.white,
      decoration: TextDecoration.none,
      height: 16 / 13);
  
  //卡片选中时标签字体
  static TextStyle tagSelectedStyle = TextStyle(
      fontFamily: 'MiSans',
      fontSize: 13,
      fontWeight: FontWeight.w500,
      color: KColor.primaryColor,
      decoration: TextDecoration.none,
      height: 16 / 13);
  
  //工具栏标题字体
  static TextStyle toolTitleStyle = const TextStyle(
      fontFamily: 'MiSans',
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: Colors.black,
      decoration: TextDecoration.none,
      height: 22 / 18);

  //工具栏按钮字体
  static TextStyle toolButtonStyle = const TextStyle(
      fontFamily: 'MiSans',
      fontSize: 13,
      fontWeight: FontWeight.w400,
      color: Colors.black,
      decoration: TextDecoration.none,
      height: 17 / 13);
  
  //工具标题栏按钮字体
  static TextStyle toolTitleButtonStyle = const TextStyle(
      fontFamily: 'MiSans',
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: Colors.white,
      decoration: TextDecoration.none,
      height: 22 / 18);

  //输入栏字体
  static TextStyle inputTextStyle = const TextStyle(
      fontFamily: 'MiSans',
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: Colors.black,
      decoration: TextDecoration.none,
      height: 22 / 18);
  
  //卡片中主体颜色字体
  static TextStyle cardPrimaryStyle = TextStyle(
      fontFamily: 'MiSans',
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: KColor.primaryColor,
      decoration: TextDecoration.none,
      height: 25 / 18);

  //折叠标题中的字体
   static TextStyle expansionHeadStyle = const TextStyle(
      fontFamily: 'MiSans',
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: Colors.white,
      decoration: TextDecoration.none,
      height: 22 / 18);

}
