import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../Config/index.dart';
import '../../Util/util_tools.dart';

class EditCard extends StatefulWidget {
  final String? id;
  final String? name;
  final ToolUtil toolUtil;
  const EditCard(
      {super.key,
      required this.id,
      required this.name,
      required this.toolUtil});

  @override
  State<EditCard> createState() => _EditCardState();
}

class _EditCardState extends State<EditCard> {
  String? name;
  String? id;

  TextEditingController? ctr1;
  TextEditingController? ctr2;

  @override
  void initState() {
    super.initState();

    name = widget.name;
    id = widget.id;

    ctr1 = TextEditingController(text: id);
    ctr2 = TextEditingController(text: name);

    //初始化
    widget.toolUtil.setListTextCtrs([]);

    //注册
    widget.toolUtil.addListTextCtrs(ctr1);
    widget.toolUtil.addListTextCtrs(ctr2);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: KDecoration.cardDecoration,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              KString.accountId,
              style: KFont.cardProfileStyle,
            ),
            const SizedBox(
              height: 12,
            ),
            TextField(
              controller: ctr1,
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
              onSubmitted: (text) {},
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '',
                contentPadding: EdgeInsets.zero,
                hintStyle: KFont.inputTextStyle,
                isDense: true,
                hintMaxLines: 1,
              ),
              strutStyle: const StrutStyle(leading: 0),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              KString.accountName,
              style: KFont.cardProfileStyle,
            ),
            const SizedBox(
              height: 12,
            ),
            TextField(
              controller: ctr2,
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
              onSubmitted: (text) {},
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '',
                contentPadding: EdgeInsets.zero,
                hintStyle: KFont.inputTextStyle,
                isDense: true,
                hintMaxLines: 1,
              ),
              strutStyle: const StrutStyle(leading: 0),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    widget.toolUtil.setListTextCtrs([]);
  }
}
