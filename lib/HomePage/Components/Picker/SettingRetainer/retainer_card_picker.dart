import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../Config/index.dart';


//折叠部件的body的卡片
class PickerRetainerCard extends StatelessWidget {
  final String? retainerName;
  final String? lastUseDate;
  final String? id;
  final String? profile;
  final Function()? addOnTap;
  final Function()? closeOnTap;


  const PickerRetainerCard({
    super.key,
    required this.retainerName,
    required this.lastUseDate,
    required this.id,
    required this.profile,
    required this.addOnTap,
    required this.closeOnTap,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      width: MediaQuery.of(context).size.width <= 1920
          ? ((1920 - 24) / 24 * 7) - 24 - 24 - 24
          : ((1920 - 24) / 24 * 7) - 24 - 24 - 24,
      height: 115,
      decoration: KDecoration.cardDecoration,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    id!,
                    style: KFont.cardProfileStyle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Expanded(child: SizedBox()),
                  Text(
                    '上次打开时间： ${lastUseDate!}',
                    style: KFont.cardProfileStyle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 54,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            retainerName!,
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
                    const SizedBox(
                      width: 16,
                    ),
                    InkWell(
                      onTap: addOnTap,
                      borderRadius: BorderRadius.circular(99),
                      child: SizedBox(
                        height: 26,
                        width: 26,
                        child: SvgPicture.asset('Svg/plus_card.svg'),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    InkWell(
                      onLongPress: closeOnTap,
                      borderRadius: BorderRadius.circular(99),
                      child: SizedBox(
                        height: 26,
                        width: 26,
                        child: SvgPicture.asset('Svg/close_card.svg'),
                      ),
                    ),
  
                  
                  ]),
            ]),
      ),
    );
  }
}
