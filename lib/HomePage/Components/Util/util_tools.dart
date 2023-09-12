import 'package:flutter/material.dart';
import 'package:moonlighter/HomePage/Model/FromJsonModel/ToolFromJsonModel/setting_retainer_from_json_model.dart';
//import '../../model/FromJsonModel/ToolFromJsonModel/setting_tag_from_json_model.dart';
import '../../Model/FromJsonModel/PickerFromJsonModel/setting_robot_from_json_model.dart';
import '../../Model/FromJsonModel/PickerFromJsonModel/setting_tag_from_json_model.dart';
import '../../Model/FromJsonModel/PickerFromJsonModel/setting_retainer_from_json_model.dart';

class ToolUtil {
  //设置Tools->SettiongRetainer->ExpansionRoleCard选中状态
  List<Function(bool)>? _listFuncSetExpansionRoleCardSelected = [];
  List<Function(bool)>? get listFuncSetExpansionRoleCardSelected =>
      _listFuncSetExpansionRoleCardSelected;
  int addListFuncSetExpansionRoleCardSelected(Function(bool)? func) {
    _listFuncSetExpansionRoleCardSelected!.add(func!);
    return _listFuncSetExpansionRoleCardSelected!.length - 1;
  }

  void setListFuncSetExpansionRoleCardSelected(List<Function(bool)>? list) {
    _listFuncSetExpansionRoleCardSelected = list;
  }

  void removeListFuncSetExpansionRoleCardSelected(Function(bool) i) {
    _listFuncSetExpansionRoleCardSelected!.remove(i);
  }

  //设置Tools->ItemBrowsing->ExpansionRoleCard选中状态
  List<Function(bool)>? _listFuncSetItemBrowsingSelected = [];
  List<Function(bool)>? get listFuncSetItemBrowsingSelected =>
      _listFuncSetItemBrowsingSelected;
  int addListFuncSetItemBrowsingSelected(Function(bool)? func) {
    _listFuncSetItemBrowsingSelected!.add(func!);
    return _listFuncSetItemBrowsingSelected!.length - 1;
  }

  void setListFuncSetItemBrowsingSelected(List<Function(bool)>? list) {
    _listFuncSetItemBrowsingSelected = list;
  }

  void removeListFuncSetItemBrowsingSelected(Function(bool) i) {
    _listFuncSetItemBrowsingSelected!.remove(i);
  }

  //设置Tools->ItemBrowsing->retainerCard选中状态
  List<Function(bool)>? _listFuncSetItemBrowsingRetainerCardSelected = [];
  List<Function(bool)>? get listFuncSetItemBrowsingRetainerCardSelected =>
      _listFuncSetItemBrowsingRetainerCardSelected;
  int addListFuncSetItemBrowsingRetainerCardSelected(Function(bool)? func) {
    _listFuncSetItemBrowsingRetainerCardSelected!.add(func!);
    return _listFuncSetItemBrowsingRetainerCardSelected!.length - 1;
  }

  void setListFuncSetItemBrowsingRetainerCardSelected(
      List<Function(bool)>? list) {
    _listFuncSetItemBrowsingRetainerCardSelected = list;
  }

  void removeListFuncSetItemBrowsingRetainerCardSelected(Function(bool) i) {
    _listFuncSetItemBrowsingRetainerCardSelected!.remove(i);
  }

  //计算Tools->ItemBrowsing->retainerCard的index
  int? _itemRetainerCardIndex = 0;
  int? get itemRetainerCardIndex => _itemRetainerCardIndex;
  void addIemRetainerCardIndex() {
    _itemRetainerCardIndex = _itemRetainerCardIndex! + 1;
  }

  //设置Tools->BidingArtisan->HeadCard选中状态
  List<Function(bool)>? _listFuncBidingArtisanHeadSelected = [];
  List<Function(bool)>? get listFuncBidingArtisanHeadSelected =>
      _listFuncBidingArtisanHeadSelected;
  int addListFuncBidingArtisanHeadSelected(Function(bool)? func) {
    _listFuncBidingArtisanHeadSelected!.add(func!);
    return _listFuncBidingArtisanHeadSelected!.length - 1;
  }

  void setListFuncBidingArtisanHeadSelected(List<Function(bool)>? list) {
    _listFuncBidingArtisanHeadSelected = list;
  }

  void removeListFuncBidingArtisanHeadSelected(Function(bool) i) {
    _listFuncBidingArtisanHeadSelected!.remove(i);
  }

  //设置Tools->BidingArtisan->BodyCard选中状态
  List<Function(bool)>? _listFuncBidingArtisanBodySelected = [];
  List<Function(bool)>? get listFuncBidingArtisanBodySelected =>
      _listFuncBidingArtisanBodySelected;
  int addListFuncBidingArtisanBodySelected(Function(bool)? func) {
    _listFuncBidingArtisanBodySelected!.add(func!);
    return _listFuncBidingArtisanBodySelected!.length - 1;
  }

  void setListFuncBidingArtisanBodySelected(List<Function(bool)>? list) {
    _listFuncBidingArtisanBodySelected = list;
  }

  void removeListFuncBidingArtisanBodySelected(Function(bool) i) {
    _listFuncBidingArtisanBodySelected!.remove(i);
  }

  //设置Tools->SettingShelf->Body选中状态
  List<Function(bool)>? _listFuncSettingShelfBodySelected = [];
  List<Function(bool)>? get listFuncSettingShelfBodySelected =>
      _listFuncSettingShelfBodySelected;
  int addListFuncSettingShelfBodySelected(Function(bool)? func) {
    _listFuncSettingShelfBodySelected!.add(func!);
    return _listFuncSettingShelfBodySelected!.length - 1;
  }

  void setListFuncSettingShelfBodySelected(List<Function(bool)>? list) {
    _listFuncSettingShelfBodySelected = list;
  }

  void removeListFuncSettingShelfBodySelected(Function(bool) i) {
    _listFuncSettingShelfBodySelected!.remove(i);
  }

  //设置Tools->SettingShelf->Head选中状态
  List<Function(bool)>? _listFuncSettingShelfHeadSelected = [];
  List<Function(bool)>? get listFuncSettingShelfHeadSelected =>
      _listFuncSettingShelfHeadSelected;
  int addListFuncSettingShelfHeadSelected(Function(bool)? func) {
    _listFuncSettingShelfHeadSelected!.add(func!);
    return _listFuncSettingShelfHeadSelected!.length - 1;
  }

  void setListFuncSettingShelfHeadSelected(List<Function(bool)>? list) {
    _listFuncSettingShelfHeadSelected = list;
  }

  void removeListFuncSettingShelfHeadSelected(Function(bool) i) {
    _listFuncSettingShelfHeadSelected!.remove(i);
  }

  //设置Tools->SellBrowsing->Body选中状态
  List<Function(bool)>? _listFuncSellBrowsingBodySelected = [];
  List<Function(bool)>? get listFuncSellBrowsingBodySelected =>
      _listFuncSellBrowsingBodySelected;
  int addListFuncSellBrowsingBodySelected(Function(bool)? func) {
    _listFuncSellBrowsingBodySelected!.add(func!);
    return _listFuncSellBrowsingBodySelected!.length - 1;
  }

  void setListFuncSellBrowsingBodySelected(List<Function(bool)>? list) {
    _listFuncSellBrowsingBodySelected = list;
  }

  void removeListFuncSellBrowsingBodySelected(Function(bool) i) {
    _listFuncSellBrowsingBodySelected!.remove(i);
  }

  //设置Tools->SellBrowsing->Head选中状态
  List<Function(bool)>? _listFuncSellBrowsingHeadSelected = [];
  List<Function(bool)>? get listFuncSellBrowsingHeadSelected =>
      _listFuncSellBrowsingHeadSelected;
  int addListFuncSellBrowsingHeadSelected(Function(bool)? func) {
    _listFuncSellBrowsingHeadSelected!.add(func!);
    return _listFuncSellBrowsingHeadSelected!.length - 1;
  }

  void setListFuncSellBrowsingHeadSelected(List<Function(bool)>? list) {
    _listFuncSellBrowsingHeadSelected = list;
  }

  void removeListFuncSellBrowsingHeadSelected(Function(bool) i) {
    _listFuncSellBrowsingHeadSelected!.remove(i);
  }

  //设置Tools->SettingMaterial->Body选中状态
  List<Function(bool)>? _listFuncSettingMaterialBodySelected = [];
  List<Function(bool)>? get listFuncSettingMaterialBodySelected =>
      _listFuncSettingMaterialBodySelected;
  int addListFuncSettingMaterialBodySelected(Function(bool)? func) {
    _listFuncSettingMaterialBodySelected!.add(func!);
    return _listFuncSettingMaterialBodySelected!.length - 1;
  }

  void setListFuncSettingMaterialBodySelected(List<Function(bool)>? list) {
    _listFuncSettingMaterialBodySelected = list;
  }

  void removeListFuncSettingMaterialBodySelected(Function(bool) i) {
    _listFuncSettingMaterialBodySelected!.remove(i);
  }

  //设置Tools->SellBrowsing->Head选中状态
  List<Function(bool)>? _listFuncSettingMaterialHeadSelected = [];
  List<Function(bool)>? get listFuncSettingMaterialHeadSelected =>
      _listFuncSettingMaterialHeadSelected;
  int addListFuncSettingMaterialHeadSelected(Function(bool)? func) {
    _listFuncSettingMaterialHeadSelected!.add(func!);
    return _listFuncSettingMaterialHeadSelected!.length - 1;
  }

  void setListFuncSettingMaterialHeadSelected(List<Function(bool)>? list) {
    _listFuncSettingMaterialHeadSelected = list;
  }

  void removeListFuncSettingMaterialHeadSelected(Function(bool) i) {
    _listFuncSettingMaterialHeadSelected!.remove(i);
  }

  //设置Tools -> SettingCompany -> roleCompanyCard中删除公会
  List<Function(bool)>? _listFuncSettingCompanySetSelect = [];
  List<Function(bool)>? get listFuncSettingCompanySetSelect =>
      _listFuncSettingCompanySetSelect;
  int addListFuncSettingCompanySetSelect(Function(bool)? func) {
    _listFuncSettingCompanySetSelect!.add(func!);
    return _listFuncSettingCompanySetSelect!.length - 1;
  }

  void setListFuncSettingCompanySetSelect(List<Function(bool)>? list) {
    _listFuncSettingCompanySetSelect = list;
  }

  void removeListFuncSettingCompanySetSelect(Function(bool) i) {
    _listFuncSettingCompanySetSelect!.remove(i);
  }

  //设置当前选中的列表item
  String? _listSelectId;
  String? get listSelectId => _listSelectId;
  void setListSelectId(String? id) {
    //test
    //print('${id}');
    _listSelectId = id;
  }

  //改变tool选项
  Function(int)? _changeTool;
  Function(int)? get changeTool => _changeTool;
  void setFuncChangeTool(Function(int)? func) {
    _changeTool = func;
  }

  //Tool编辑时的TextEditorController列表
  List<TextEditingController>? _textCtrs;
  List<TextEditingController>? get textCtrs => _textCtrs;
  void setListTextCtrs(List<TextEditingController>? list) {
    _textCtrs = list!;
  }

  void addListTextCtrs(TextEditingController? ctr) {
    _textCtrs!.add(ctr!);
  }

  //SettingTag中往viewModel添加tag
  Function(PickerTag)? _addViewModelTag;
  Function(PickerTag)? get addViewModelTag => _addViewModelTag;
  void setFuncAddViewModelTag(Function(PickerTag)? func) {
    _addViewModelTag = func!;
  }

  //SettingRobot中往toolViewModel添加robot
  Function(PickerRobot)? _addViewModelRobot;
  Function(PickerRobot)? get addViewModelRobot => _addViewModelRobot;
  void setFuncAddViewModelRobot(Function(PickerRobot)? func) {
    _addViewModelRobot = func!;
  }

  //SettingRetainer中刷新body高度
  //Function? _refreshBodyHeight;
  //Function? get refreshBodyHeight => _refreshBodyHeight;
  //void setFuncRefreshBodyHeight(Function? func) {
  //  _refreshBodyHeight = func!;
  // }

  //设置当前选中的角色
  int _currentRoleIndex = 0;
  int get currentRoleIndex => _currentRoleIndex;
  void setCurrentRoleIndex(int index) {
    _currentRoleIndex = index;
  }

  //settingRetainer中往role里添加retainer的方法数组
  List<Function(Retainer)>? _listFuncInsertRetainer;
  List<Function(Retainer)>? get listFuncInsertRetainer =>
      _listFuncInsertRetainer;

  void addListFuncInsertRetainer(Function(Retainer) func) {
    _listFuncInsertRetainer!.add(func);
  }

  void setListFuncInsertRetainer(List<Function(Retainer)>? list) {
    _listFuncInsertRetainer = list!;
  }

  void removeListFuncInsertRetainer(Function(Retainer) func) {
    _listFuncInsertRetainer!.remove(func);
  }

  //PickerItemBrowsingFuture中刷新数据
  Function? _refreshPickerItemBrowsingFuture;
  Function? get refreshPickerItemBrowsingFuture => _refreshPickerItemBrowsingFuture;
  void setFuncRefreshPickerItemBrowsingFuture(Function? func) {
    _refreshPickerItemBrowsingFuture = func!;
  }


  //当前选中的retainer的retainerId;
  String? _currentRetainerId;
  String? get currentRetainerId => _currentRetainerId;
  void setCurrentRetainerId(String? retainerId) {
    _currentRetainerId = retainerId!;
  }



}
