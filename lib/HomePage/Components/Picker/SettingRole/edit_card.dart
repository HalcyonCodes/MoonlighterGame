import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../Config/index.dart';

class EditCard extends StatefulWidget {
  const EditCard({super.key});

  @override
  State<EditCard> createState() => _EditCardState();
}

class _EditCardState extends State<EditCard> {
  TextEditingController? ctr1;
  TextEditingController? ctr2;
  TextEditingController? ctr3;
  TextEditingController? ctr4;
  TextEditingController? ctr5;

  @override
  void initState() {
    super.initState();
    ctr1 = TextEditingController();
    ctr2 = TextEditingController();
    ctr3 = TextEditingController();
    ctr4 = TextEditingController();
    ctr5 = TextEditingController(); 
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: KDecoration.cardDecoration,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              KString.roleId,
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
            const SizedBox(height: 20,),
            Text(
              KString.roleName,
              style: KFont.cardProfileStyle,
            ),
            const SizedBox(
              height: 12,
            ),
            SizedBox(
              height: 22,
              child: TextField(
                controller: ctr2,
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
            const SizedBox(height: 20,),
            Text(
              KString.roleChannel,
              style: KFont.cardProfileStyle,
            ),
            const SizedBox(
              height: 12,
            ),
            SizedBox(
              height: 22,
              child: TextField(
                controller: ctr3,
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
            const SizedBox(height: 20,),
            Text(
              KString.roleCategory,
              style: KFont.cardProfileStyle,
            ),
            const SizedBox(
              height: 12,
            ),
            SizedBox(
              height: 22,
              child: TextField(
                controller: ctr4,
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
            const SizedBox(height: 20,),
            Text(
              KString.roleProfile,
              style: KFont.cardProfileStyle,
            ),
            const SizedBox(
              height: 12,
            ),
            SizedBox(
              height: 22,
              child: TextField(
                controller: ctr5,
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
      ),
    );
  }
}
