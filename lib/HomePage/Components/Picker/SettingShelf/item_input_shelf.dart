import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../Config/index.dart';

class ShelfItemInput extends StatefulWidget {
  final String? itemName;
  final String? itemType;
  final String? itemCount;
  final Function()? delectOnTap;

  const ShelfItemInput(
      {super.key,
      this.itemName,
      this.itemType,
      this.itemCount,
      this.delectOnTap});

  @override
  State<ShelfItemInput> createState() => _ShelfItemInputState();
}

class _ShelfItemInputState extends State<ShelfItemInput> {
  TextEditingController? nameCtrl;
  TextEditingController? typeCtrl;
  TextEditingController? countCtrl;

  @override
  void initState() {
    super.initState();
    nameCtrl = TextEditingController(text: widget.itemName);
    typeCtrl = TextEditingController(text: widget.itemType);
    countCtrl = TextEditingController(text: widget.itemCount);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width - 24) / 24 * 8 ,
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: SizedBox(
              height: 22,
              child: TextField(
                controller: nameCtrl,
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
         const SizedBox(width: 24,),
          SizedBox(
            width: 21,
            height: 22,
            child: TextField(
              controller: typeCtrl,
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
          const SizedBox(
            width: 24,
          ),
          SizedBox(
            width: 35,
            child: TextField(
              controller: countCtrl,
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
          const SizedBox(
            width: 24,
          ),
          SizedBox(
            width: 22,
            height: 22,
            child: InkWell(
                onTap: widget.delectOnTap,
                borderRadius: BorderRadius.circular(99),
                child: SvgPicture.asset('Svg/close_card.svg')),
          )
        ],
      ),
    );
  }


  
  @override
  void dispose() {
    super.dispose();
  }
}
