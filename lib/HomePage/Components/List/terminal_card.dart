import 'package:flutter/material.dart';
import '../../../Config/index.dart';
import './tag_card.dart';
import './status_card.dart';
import '../Util/util_list.dart';
import '../../Model/ViewModel/ListViewModel/list_view_model.dart';
import '../Util/util_tools.dart';
import '../Util/util_picker.dart';

class TerminalCard extends StatefulWidget {
  final String id;
  final String name;
  final String buildTime;
  final String robotCategory;
  final List<String> tags;
  final String status;
  final ListUtil util;
  final ListViewModel viewModel;
  final ToolUtil toolUtil;
  final PickerUtil pickerUtil;

  const TerminalCard(
      {super.key,
      required this.id,
      required this.name,
      required this.buildTime,
      required this.robotCategory,
      required this.tags,
      required this.status,
      required this.util,
      required this.viewModel,
      required this.toolUtil,
      required this.pickerUtil});

  @override
  State<TerminalCard> createState() => _TerminalCardState();
}

class _TerminalCardState extends State<TerminalCard> {
  bool? isSelect;

  String? id;
  String? name;
  String? buildTime;
  String? robotCategory;
  List<String>? tags;
  String? status;

  List<CardTag>? tagWidgets;
  int? cardIndex;

  @override
  void initState() {
    super.initState();
    id = widget.id;
    name = widget.name;
    buildTime = widget.buildTime;
    robotCategory = widget.robotCategory;
    tags = widget.tags;
    status = widget.status;
    isSelect = false;

    //注册函数
    cardIndex = widget.util.addListFuncCancelSelected(setCancelSelect);
  }

  @override
  Widget build(BuildContext context) {
    tagWidgets = List.generate(tags!.length, (index) {
      return CardTag(isSelect: isSelect, tag: tags![index]);
    });
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onClick,
        child: Container(
          width: MediaQuery.of(context).size.width <= 1920
              ? (1920 - 24) / 24 * 7 - 24
              : (1920 - 24) / 24 * 7 - 24,
          decoration: isSelect == false
              ? KDecoration.cardDecoration
              : KDecoration.cardSelectedDecoration,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 17,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(id!,
                          style: isSelect == false
                              ? KFont.cardProfileStyle
                              : KFont.cardProfileSelectedStyle,
                          maxLines: 1,
                          overflow: TextOverflow.clip),
                      const Expanded(child: SizedBox()),
                      Text(robotCategory!,
                          style: isSelect == false
                              ? KFont.cardProfileStyle
                              : KFont.cardProfileSelectedStyle,
                          maxLines: 1,
                          overflow: TextOverflow.clip),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 25,
                  child: Text(name!,
                      style: isSelect == true
                          ? KFont.cardTitleSelectedStyle
                          : KFont.cardTitleStyle,
                      maxLines: 1,
                      overflow: TextOverflow.clip),
                ),
                const SizedBox(
                  height: 12,
                ),
                SizedBox(
                  height: 17,
                  child: Text('创建时间： ${buildTime!}',
                      style: isSelect == true
                          ? KFont.cardProfileSelectedStyle
                          : KFont.cardProfileStyle,
                      maxLines: 1,
                      overflow: TextOverflow.clip),
                ),
                const SizedBox(
                  height: 20,
                ),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: tagWidgets!,
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                    height: 26,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CardStatus(
                          isCardSelect: isSelect,
                          isSelect: status == 'play' ? true : false,
                          path: 'Svg/play_list.svg',
                          onTap: onPlay,
                        ),
                        const SizedBox(
                          width: 24,
                        ),
                        CardStatus(
                          isCardSelect: isSelect,
                          isSelect: status == 'stop' ? true : false,
                          path: 'Svg/stop_list.svg',
                          onTap: onStop,
                        ),
                        const SizedBox(
                          width: 24,
                        ),
                        CardStatus(
                          isCardSelect: isSelect,
                          isSelect: status == 'pause' ? true : false,
                          path: 'Svg/pause_list.svg',
                          onTap: onPause,
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void setCancelSelect() {
    isSelect = false;
    refreshUi();
  }

  void onClick() {
    isSelect == true
        ? (() {
            for (int i = 0;
                i <= widget.util.listFuncCancelSelected!.length - 1;
                i++) {
              widget.util.listFuncCancelSelected![i]();
            }
            widget.toolUtil.setListSelectId(null);
          })()
        : (() {
            for (int i = 0;
                i <= widget.util.listFuncCancelSelected!.length - 1;
                i++) {
              widget.util.listFuncCancelSelected![i]();
            }
            widget.toolUtil.setListSelectId(id!);
            isSelect = true;
          })();

    widget.toolUtil.changeTool!(15);
    widget.pickerUtil.changePickerCurrentIndex!(15);

    refreshUi();
  }

  void onPlay() async {
    if (status != 'play') {
      try {
        int respondCode = await widget.viewModel.setTerimalStatus(id!, 'play');
        if (respondCode == 200) {
          status = 'play';
          refreshUi();
        } else {
          //提示修改失败
        }
      } catch (e) {
        //提示修改失败
      }
    }
  }

  void onPause() async {
    if (status != 'pause') {
      try {
        int respondCode = await widget.viewModel.setTerimalStatus(id!, 'pause');
        if (respondCode == 200) {
          status = 'pause';
          refreshUi();
        } else {
          //提示修改失败
        }
      } catch (e) {
        //提示修改失败
      }
    }
  }

  void onStop() async {
    if (status != 'stop') {
      try {
        int respondCode = await widget.viewModel.setTerimalStatus(id!, 'stop');
        if (respondCode == 200) {
          status = 'stop';
          refreshUi();
        } else {
          //提示修改失败
        }
      } catch (e) {
        //提示修改失败
      }
    }
  }

  void refreshUi() {
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    widget.util.removeListFuncCancelSelected(setCancelSelect);
    //print(widget.util.listFuncCancelSelected!.length - 1);
  }
}
