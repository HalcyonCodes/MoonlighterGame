import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../Config/index.dart';

class RobotCard extends StatelessWidget {
  final String? id;
  final String? date;
  final String? name;
  final String? profile;
  final String? bindingCount;
  final String? scripCount;
  final Function()? onTap;

  const RobotCard(
      {super.key,
      required this.id,
      required this.date,
      required this.name,
      required this.profile,
      required this.bindingCount,
      required this.scripCount,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width <= 1920
          ? ((1920 - 24) / 24) * 7 - 24
          : ((1920 - 24) / 24) * 7 - 24,
      decoration: KDecoration.cardDecoration,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(children: [
            Text(
              id!,
              style: KFont.cardProfileStyle,
            ),
            const Expanded(
              child: SizedBox(),
            ),
            Text(
              '创建时间： ${date!}',
              style: KFont.cardProfileStyle,
            ),
          ]),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 54,
                width:  MediaQuery.of(context).size.width <= 1920
          ? ((1920 - 24) / 24) * 7 - 24 - 24 - 24 - 16 - 26
          : ((1920 - 24) / 24) * 7 - 24 - 24 - 24 - 16 - 26,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      name!,
                      style: KFont.cardTitleStyle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      profile!,
                      style: KFont.cardProfileStyle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const Expanded(child: SizedBox()),
              InkWell(
                onTap: onTap,
                child: SizedBox(
                  height: 26,
                  width: 26,
                  child: SvgPicture.asset('Svg/minus_card.svg'),
                ),
              )
            ],
          ),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(KString.bindingCount, style: KFont.cardProfileStyle,),
                    const SizedBox(height: 8,),
                    Text(bindingCount!, style: KFont.cardPrimaryStyle,maxLines: 1,
                      overflow: TextOverflow.ellipsis,),
                  ],
                )),
               Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(KString.scripCount, style: KFont.cardProfileStyle,),
                    const SizedBox(height: 8,),
                    Text(scripCount!, style: KFont.cardPrimaryStyle,maxLines: 1,
                      overflow: TextOverflow.ellipsis,),
                  ],
                ))
            ],
          )
        ],
      ),
    );
  }
}
