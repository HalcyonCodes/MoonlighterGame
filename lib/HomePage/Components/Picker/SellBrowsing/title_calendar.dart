import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../Config/index.dart';

class CalendarTitle extends StatefulWidget {
  final String year;
  final String month;
  final Function? onLeftTap;
  final Function? onRightTap;

  const CalendarTitle({super.key, required this.month, required this.year, required this.onLeftTap, required this.onRightTap});

  @override
  State<CalendarTitle> createState() => _CalendarTitleState();
}

class _CalendarTitleState extends State<CalendarTitle> {
  String? year;
  String? month;

  @override
  void initState() {
    super.initState();
    year = widget.year;
    month = widget.month;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 46,
        decoration: KDecoration.cardDecoration,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 22,
                width: 22,
                child: InkWell(
                    onTap: onLeftTap,
                    child: SvgPicture.asset('Svg/caret_left_card.svg')),
              ),
              Expanded(
                  child: Container(
                alignment: Alignment.center,
                height: 22,
                child: Text(
                  '${year!}年${month!}月',
                  style: KFont.toolTitleStyle,
                ),
              )),
              SizedBox(
                height: 22,
                width: 22,
                child: InkWell(
                    onTap: onRightTap,
                    child: SvgPicture.asset('Svg/caret_right_card.svg')),
              ),
            ],
          ),
        ));
  }

  void onLeftTap() {
    widget.onLeftTap!();
  }

  void onRightTap() {
    widget.onRightTap!();
  }
}
