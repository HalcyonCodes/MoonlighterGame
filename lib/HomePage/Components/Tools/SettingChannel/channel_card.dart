import 'package:flutter/material.dart';
import '../../../../Config/index.dart';
import 'package:flutter_svg/svg.dart';

class ChannelCard extends StatelessWidget {
  final Function()? onUpTap;
  final Function()? onDownTap;
  final Function()? onRemoveTap;
  final String channelName;
  final String channelClassName;

  const ChannelCard(
      {super.key,
      required this.onDownTap,
      required this.onUpTap,
      required this.onRemoveTap,
      required this.channelName,
      required this.channelClassName
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      width:MediaQuery.of(context).size.width <= 1920
          ? ((1920 - 24) / 24) * 7 - 24
          : ((1920 - 24) / 24) * 7 - 24,
      decoration: KDecoration.cardDecoration,
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        child: Row(
          children: [
            Text(channelClassName, 
              style: KFont.expansionHeadUnSelectStyle,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              ),
            const Text(' : '),
            Text(channelName, style: KFont.expansionHeadUnSelectStyle,overflow: TextOverflow.ellipsis,
            maxLines: 1,
            ),
            const Expanded(child: SizedBox()),
            InkWell(
              borderRadius: BorderRadius.circular(99),
              onTap: (){onUpTap!();},
              child: SizedBox(
                height: 26,
                width: 26,
                child: SvgPicture.asset('Svg/up_card.svg'),
              ),
            ),
            const SizedBox(width: 16,),
            InkWell(
              borderRadius: BorderRadius.circular(99),
              onTap: (){onDownTap!();},
              child: SizedBox(
                height: 26,
                width: 26,
                child: SvgPicture.asset('Svg/down_card.svg'),
              ),
            ),
            const SizedBox(width: 16,),
            InkWell(
              borderRadius: BorderRadius.circular(99),
              onTap: (){onRemoveTap!();},
              child: SizedBox(
                height: 26,
                width: 26,
                child: SvgPicture.asset('Svg/minus_card.svg'),
              ),
            ),
          ],
        ),
      ),
    );
  }




}
