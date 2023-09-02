import 'package:flutter/material.dart';
import '../../../ToolWidgets/rectangle_cliper.dart';
import './terminal_card.dart';
import '../Util/util_list.dart';
import '../../model/ViewModel/ListViewModel/list_view_model.dart';
import '../Util/util_tools.dart';

class TerminalList extends StatefulWidget {
  final ListViewModel listViewModel;
  final ListUtil? listUtil;
  final ToolUtil? toolUtil;

  const TerminalList({super.key, required this.listViewModel, required this.listUtil, required this.toolUtil});

  @override
  State<TerminalList> createState() => _TerminalListState();
}

class _TerminalListState extends State<TerminalList> {

  List<Widget>? listItems;

  @override
  void initState() {
    super.initState();


    listItems = List.generate(widget.listViewModel.listTerimalModel!.data.terimals.length, (index) {
      return TerminalCard(
        key: UniqueKey(),
        id: widget.listViewModel.listTerimalModel!.data.terimals[index].terimalId,
        name: widget.listViewModel.listTerimalModel!.data.terimals[index].terimalName,
        buildTime: widget.listViewModel.listTerimalModel!.data.terimals[index].terimalCreateTime,
        robotCategory: widget.listViewModel.listTerimalModel!.data.terimals[index].terimalCategory,
        tags: widget.listViewModel.listTerimalModel!.data.terimals[index].terimalTags,
        status: widget.listViewModel.listTerimalModel!.data.terimals[index].terimalStatus,
        util: widget.listUtil!,
        viewModel: widget.listViewModel,
        toolUtil: widget.toolUtil!,
      );
    });

    widget.listUtil!.setListFuncCancelSelected([]);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 24 - 24 - 46 - 32,
      width: MediaQuery.of(context).size.width <= 1920
          ? (1920 - 24) / 24 * 7 - 24
          : (1920 - 24) / 24 * 7 - 24,
      child: ClipPath(
        clipper: RectangleClipper(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           
            SizedBox(
              height: MediaQuery.of(context).size.height - 24 - 24 - 46 - 32,
              child: ClipPath(
                clipper: RectangleClipper(),
                child: ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context).copyWith(
                    scrollbars: false,
                  ),
                  child: ListView(
                    clipBehavior: Clip.none,
                    children: listItems!,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
