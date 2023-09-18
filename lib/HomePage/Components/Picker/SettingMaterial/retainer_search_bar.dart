import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../Config/index.dart';
import '../../../Model/ViewModel/PickerViewModel/setting_material_view_model.dart';

class RetainerSearchBar extends StatefulWidget {
  final Function? onTap;
  final SettingMaterialPickerViewModel viewModel;
  const RetainerSearchBar({super.key, required this.onTap, required this.viewModel});

  @override
  State<RetainerSearchBar> createState() => _RetainerSearchBarState();
}

class _RetainerSearchBarState extends State<RetainerSearchBar> {
  int? currentIndex;

  bool? isSearchId;
  bool? isName;
  TextEditingController? ctrl;

  @override
  void initState() {
    super.initState();
    currentIndex = 0;
    isSearchId = false;
    isName = true;
    ctrl = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      width: MediaQuery.of(context).size.width <= 1920
          ? (1920 - 24) / 24 * 8 - 24
          : (1920 - 24) / 24 * 8 - 24,
      decoration: KDecoration.cardDecoration,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16), bottomLeft: Radius.circular(16)),
            onTap: ontap,
            child: Container(
              width: 88,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      bottomLeft: Radius.circular(16)),
                  color: KColor.primaryColor),
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 10, 10, 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      isName == true
                          ? KString.retainer
                          : isSearchId == true
                              ? KString.idString
                              : ' ',
                      style: KFont.searchBarButtonStyle,
                      strutStyle: const StrutStyle(leading: 0),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    SizedBox(
                        height: 12,
                        width: 12,
                        child: SvgPicture.asset(
                          'Svg/angle_down_search.svg',
                          color: Colors.white,
                        ))
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Container(
              height: 22,
              alignment: Alignment.center,
              child: TextField(
                controller: ctrl,
                maxLines: 1,
                style: KFont.searchBarStyle,
                autofocus: false,
                cursorColor: Colors.black,
                cursorWidth: 2,
                cursorHeight: 22,
                inputFormatters: <TextInputFormatter>[
                  LengthLimitingTextInputFormatter(200),
                ],
                maxLength: null,
                onSubmitted: commit,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: ' ',
                  contentPadding: EdgeInsets.zero,
                  hintStyle: KFont.searchBarInitStyle,
                  isDense: true,
                  hintMaxLines: 1,
                ),
                strutStyle: const StrutStyle(leading: 0),
              ),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          SizedBox(
            height: 22,
            width: 22,
            child: SvgPicture.asset('Svg/search_search.svg'),
          ),
          const SizedBox(
            width: 24,
          )
        ],
      ),
    );
  }

  void ontap() {
    currentIndex == 1 ? currentIndex = 0 : currentIndex = currentIndex! + 1;
    isSearchId = false;
    isName = false;
    currentIndex == 0
        ? isName = true
        : currentIndex == 1
            ? isSearchId = true
            : () {};
    refreshUi();
  }

  void refreshUi() {
    setState(() {});
  }

  void commit(String text) async {
    String type = currentIndex == 0 ? 'name' : 'id';
    await widget.viewModel.search(text, type);
    widget.onTap!();
  }
}
