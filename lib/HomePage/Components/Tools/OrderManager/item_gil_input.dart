import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../Config/index.dart';

//菜单下面带价格输入的菜单项
class ItemGilInput extends StatefulWidget {
  final String? gil;


  final Function()? delectOnTap;

  const ItemGilInput(
      {super.key,
      this.gil,

      this.delectOnTap});

  @override
  State<ItemGilInput> createState() => _ItemGilInputState();
}

class _ItemGilInputState extends State<ItemGilInput> {
  TextEditingController? gilCtrl;


  @override
  void initState() {
    super.initState();
    gilCtrl = TextEditingController(text: widget.gil);

  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (MediaQuery.of(context).size.width - 24) / 24 * 7,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: SizedBox(
              height: 22,
              child: TextField(
                controller: gilCtrl,
                maxLines: 1,
                style: KFont.itemListStyle,
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
                  hintText: ' ',
                  contentPadding: EdgeInsets.zero,
                  hintStyle: KFont.inputTextStyle,
                  isDense: true,
                  hintMaxLines: 1,
                ),
                strutStyle: const StrutStyle(leading: 0),
              ),
            ),
          ),
          // const Expanded(child: SizedBox()),
     
          
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
