
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../Config/index.dart';

class PickerTagCard extends StatelessWidget {
  final String? name;
  final String? date;
  final Function()? onDelectTap;
  final Function()? onAddTap;
  const PickerTagCard({super.key, required this.name, required this.date, required this.onDelectTap, required this.onAddTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: KDecoration.cardDecoration,
      margin: const EdgeInsets.only(bottom: 16),
      height: 78,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 54,
              width: 54,
              decoration: BoxDecoration(
                color: KColor.primaryColor,
                borderRadius: BorderRadius.circular(99),
              ),
              alignment: Alignment.center,
              child: SizedBox(
                height: 26,
                width: 26,
                child: SvgPicture.asset('Svg/tag_tool.svg',color: Colors.white,)),
            ),
            const SizedBox(width: 12,),
            Column(
              mainAxisAlignment: MainAxisAlignment.start, 
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name!, style: KFont.cardTitleStyle,maxLines: 1, overflow: TextOverflow.clip,),
                const SizedBox(height: 12,),
                Text('创建于 ${date!}', style: KFont.cardProfileStyle,maxLines: 1, overflow: TextOverflow.clip),
              ],
            ),
            const Expanded(child: SizedBox()),
            Container(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 14),
                child: InkWell(
                  borderRadius: BorderRadius.circular(99),
                  onTap: onAddTap,
                  child: SizedBox(height: 26, width: 26,child: SvgPicture.asset('Svg/plus_card.svg'),),
                ),
              ),
            ),
            const SizedBox(width: 16,),
            Container(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 14),
                child: InkWell(
                  borderRadius: BorderRadius.circular(99),
                  onTap: onAddTap,
                  child: SizedBox(height: 26, width: 26,child: SvgPicture.asset('Svg/close_card.svg'),),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  




}