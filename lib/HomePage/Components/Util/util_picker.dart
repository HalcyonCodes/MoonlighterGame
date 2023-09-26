import 'package:flutter/material.dart';

class PickerUtil {
  //Picker中改变当前选项
  Function? _changePickerCurrentIndex;
  Function? get changePickerCurrentIndex => _changePickerCurrentIndex;
  void setFuncChangePickerCurrentIndex(Function? func) {
    _changePickerCurrentIndex = func;
  }

  //SellBrowsing中修改日历按钮选中
  List<Function>? _listChangeSellBrowsingCalendarSelect;
  List<Function>? get listChangeSellBrowsingCalendarSelect =>
      _listChangeSellBrowsingCalendarSelect;

  void addListChangeSellBrowsingCalendarSelect(Function? func) {
    _listChangeSellBrowsingCalendarSelect!.add(func!);
  }

  void setFuncListChangeSellBrowsingCalendarSelect(List<Function>? funcs) {
    _listChangeSellBrowsingCalendarSelect = funcs;
  }

  void removeFuncListChangeSellBrowsingCalendarSelect(Function? func) {
    _listChangeSellBrowsingCalendarSelect!.remove(func);
  }

  //Picker编辑时的TextEditorController列表
  List<TextEditingController>? _textCtrs;
  List<TextEditingController>? get textCtrs => _textCtrs;
  void setListTextCtrs(List<TextEditingController>? list) {
    _textCtrs = list!;
  }

  void addListTextCtrs(TextEditingController? ctr) {
    _textCtrs!.add(ctr!);
  }

  //PickerSettingTag中刷新tagList列表
  Function? _refreshTagList;
  Function? get refreshTagList => _refreshTagList;
  void setFuncRefreshTagList(Function? func) {
    _refreshTagList = func;
  }

  //PickerSettingRetainerFuture中刷新组件
  Function? _refreshRetainer;
  Function? get refreshRetainer => _refreshRetainer;
  void setFuncRefreshRetainer(Function? func) {
    _refreshRetainer = func;
  }

  //PickerSettingRetainer中RetainerList里插入retainer
  Function? _insertRetainer;
  Function? get insertRetainer => _insertRetainer;
  void setFuncInsertRetainer(Function? func) {
    _insertRetainer = func;
  }

  //PickerSettingShelfFuture中刷新ui
  Function? _refreshSettingShelfFuture;
  Function? get refreshSettingShelfFuture => _refreshSettingShelfFuture;
  void setFuncRefreshSettingShelfFuture(Function? func) {
    _refreshSettingShelfFuture = func;
  }

  //SettingShelf中ShelfItemInput中的textinputCtrl集合
  List<TextEditingController>? _nameCtls;
  List<TextEditingController>? get nameCtls => _nameCtls;
  void setNameCtls(List<TextEditingController>? list) {
    _nameCtls = list!;
  }

  void addNameCtls(TextEditingController? ctr) {
    _nameCtls!.add(ctr!);
  }

  void removeNameCtls(TextEditingController? ctr) {
    _nameCtls!.remove(ctr!);
  }

  List<TextEditingController>? _typeCtls;
  List<TextEditingController>? get typeCtls => _typeCtls;
  void setTypeCtls(List<TextEditingController>? list) {
    _typeCtls = list!;
  }

  void addTypeCtls(TextEditingController? ctr) {
    _typeCtls!.add(ctr!);
  }

  void removeTypeCtls(TextEditingController? ctr) {
    _typeCtls!.remove(ctr!);
  }

  List<TextEditingController>? _countCtls;
  List<TextEditingController>? get countCtls => _countCtls;
  void setCountCtls(List<TextEditingController>? list) {
    _countCtls = list!;
  }

  void addCountCtls(TextEditingController? ctr) {
    _countCtls!.add(ctr!);
  }

  void removeCountCtls(TextEditingController? ctr) {
    _countCtls!.remove(ctr!);
  }

  //settingShelf中shelfItemList中刷新list
  Function? _refreshShelfItemList;
  Function? get refreshShelfItemList => _refreshShelfItemList;
  void setFuncRefreshShelfItemList(Function? func) {
    _refreshShelfItemList = func!;
  }

  //settingShelf中刷新retainerSearch
  Function? _refreshRetainerSearch;
  Function? get refreshRetainerSearch => _refreshRetainerSearch;
  void setFuncRefreshRetainerSearch(Function? func) {
    _refreshRetainerSearch = func!;
  }

  //settingShelf中刷新retainerList
  Function? _refreshRetainerList;
  Function? get refreshRetainerList => _refreshRetainerList;
  void setFuncRefreshRetainerList(Function? func) {
    _refreshRetainerList = func!;
  }

  //sellBrowsing中刷新SellItemListFuture
  Function? _refreshSellItemListFuture;
  Function? get refreshSellItemListFuture => _refreshSellItemListFuture;
  void setFuncRefreshSellItemListFuture(Function? func) {
    _refreshSellItemListFuture = func!;
  }

  //sellBrowsing中刷新日历所有按钮
  Function? _refreshCalendarButton;
  Function? get refreshCalendarButton => _refreshCalendarButton;
  void setFuncRefreshCalendarButton(Function? func) {
    _refreshCalendarButton = func!;
  }

  //sellBrowsing中设置日期
  Function? _setCalendarDate;
  Function? get setCalendarDate => _setCalendarDate;
  void setFuncSetCalendarDate(Function? func) {
    _setCalendarDate = func!;
  }

  //SellBrowsing中刷新calendarFuture
  Function? _refreshCalendarFuture;
  Function? get refreshCalendarFuture => _refreshCalendarFuture;
  void setFuncRefreshCalendarFuture(Function? func) {
    _refreshCalendarFuture = func!;
  }

  //SettingRole中PickerRoleList中刷新
  Function? _refreshPickerRoleList;
  Function? get refreshPickerRoleList => _refreshPickerRoleList;
  void setFuncRefreshPickerRoleList(Function? func) {
    _refreshPickerRoleList = func!;
  }

  //SettingRole中PickerRoleList中添加role
  Function? _insertPickerRoleListRole;
  Function? get insertPickerRoleListRole => _insertPickerRoleListRole;
  void setFuncInsertPickerRoleListRole(Function? func) {
    _insertPickerRoleListRole = func!;
  }

  //SettingRole中PickerRoleList中获取toJsonModel
  Function? _getPickerRoleListToJsonModel;
  Function? get getPickerRoleListToJsonModel => _getPickerRoleListToJsonModel;
  void setFuncGetPickerRoleListToJsonModel(Function? func) {
    _getPickerRoleListToJsonModel = func!;
  }

  //SettingTag中PickerTagList中获取toJsonModel
  Function? _getPickerTagListToJsonModel;
  Function? get getPickerTagListToJsonModel => _getPickerTagListToJsonModel;
  void setFuncGetPickerTagListToJsonModel(Function? func) {
    _getPickerTagListToJsonModel = func!;
  }

  //SettingRetainer中PickerRetainerList中获取toJsonModel
  Function? _getPickerRetainerToJsonModel;
  Function? get getPickerRetainerToJsonModel => _getPickerRetainerToJsonModel;
  void setFuncGetPickerRetainerToJsonModel(Function? func) {
    _getPickerRetainerToJsonModel = func!;
  }

  //SettingShelf中刷新title中的数字
  Function? _refreshSettingShelfCount;
  Function? get refreshSettingShelfCount => _refreshSettingShelfCount;
  void setFuncRefreshSettingShelfCount(Function? func) {
    _refreshSettingShelfCount = func!;
  }

   //SettingMaterial中刷新title中的数字
  Function? _refreshSettingMaterialCount;
  Function? get refreshSettingMaterialCount => _refreshSettingMaterialCount;
  void setFuncRefreshSettingMaterialCount(Function? func) {
    _refreshSettingMaterialCount = func!;
  }

}
