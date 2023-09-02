import 'package:flutter/material.dart';
import './terminal_list.dart';
import '../../model/ViewModel/ListViewModel/list_view_model.dart';
import '../Util/util_tools.dart';
import '../Util/util_list.dart';
import './terminal_search_bar.dart';

class TerimalListFuture extends StatefulWidget {
  final ToolUtil toolUtil;
  final ListUtil listUtil;

  const TerimalListFuture(
      {super.key, required this.toolUtil, required this.listUtil});

  @override
  State<TerimalListFuture> createState() => _TerimalListFutureState();
}

class _TerimalListFutureState extends State<TerimalListFuture> {
  String? searchTag;
  String? searchName;
  String? searchId;

  ListViewModel? viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = ListViewModel();
    searchTag = ' ';
    searchName = ' ';
    searchId = ' ';

    //注册
    widget.listUtil.setFuncSearchNameString(setSearchNameString);
    widget.listUtil.setFuncSearchTagString(setSearchTagString);
    widget.listUtil.setFuncSearcIdString(setSearchIdString);
    widget.listUtil.setFuncRefreshList(refreshUi);
    widget.listUtil.setFuncRefreshListNormal(refreshUiNormal);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 24 - 24,
      width: MediaQuery.of(context).size.width <= 1920
          ? (1920 - 24) / 24 * 7 - 24
          : (1920 - 24) / 24 * 7 - 24,
      child: Column(
        
    
        children: [
           TerminalSearchBar(listUtil: widget.listUtil,),
              const SizedBox(
                height: 32,
              ),
          FutureBuilder(
            future: searchName == ' '
                ? searchTag == ' '
                    ? searchId == ' '
                        ? viewModel!.refresh()
                        : viewModel!.searchWithId(searchId!)
                    : viewModel!.searchWithTag(searchTag!)
                : viewModel!.searchWithName(searchName!),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return Text('waiting');
                case ConnectionState.active:
                  return Text('active');
                case ConnectionState.done:
                  return TerminalList(
                    listViewModel: viewModel!,
                    listUtil: widget.listUtil,
                    toolUtil: widget.toolUtil,
                  );
              }
            })],
      ),
    );
  }

  void setSearchNameString(String text) {
    searchId = ' ';
    searchTag = ' ';
    searchName = text;
  }

  void setSearchTagString(String text) {
    searchName = ' ';
    searchId = ' ';
    searchTag = text;
  }

  void setSearchIdString(String text) {
    searchName = ' ';
    searchTag = ' ';
    searchId = text;
  }

  void refreshUi() {
    setState(() {});
  }

  void refreshUiNormal() {
    searchName = ' ';
    searchTag = ' ';
    searchId = ' ';
    setState(() {});
  }
}
