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
}
