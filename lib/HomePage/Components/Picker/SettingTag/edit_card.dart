import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../Config/index.dart';
import '../../Util/util_picker.dart';

class EditCard extends StatefulWidget {
  final PickerUtil pickerUtil;

  const EditCard({super.key, required this.pickerUtil});

  @override
  State<EditCard> createState() => _EditCardState();
}

class _EditCardState extends State<EditCard> {
  TextEditingController? ctr1;

  @override
  void initState() {
    super.initState();
    ctr1 = TextEditingController();

    //清空
    widget.pickerUtil.setListTextCtrs([]);

    //注册
    widget.pickerUtil.addListTextCtrs(ctr1);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 83,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: KDecoration.cardDecoration,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            KString.tagName,
            style: KFont.cardProfileStyle,
          ),
          const SizedBox(
            height: 12,
          ),
          SizedBox(
            height: 22,
            child: TextField(
              controller: ctr1,
              maxLines: 1,
              style: KFont.searchBarStyle,
              autofocus: false,
              cursorColor: Colors.black,
              cursorWidth: 2,
              cursorHeight: 22,
              inputFormatters: <TextInputFormatter>[
                LengthLimitingTextInputFormatter(60),
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
          ),
        ],
      ),
    );
  }
}
