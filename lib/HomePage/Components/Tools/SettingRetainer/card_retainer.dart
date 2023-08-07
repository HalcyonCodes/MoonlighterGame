import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../Config/index.dart';

class RetainerCard extends StatelessWidget {
  final String? containerName;
  final String? lastUseDate;
  final String? id;
  final String? profile;
  final Function()? upOnTap;
  final Function()? downOnTap;
  final Function()? removeOnTap;

  const RetainerCard({
    super.key,
    required this.containerName,
    required this.lastUseDate,
    required this.id,
    required this.profile,
    required this.downOnTap,
    required this.removeOnTap,
    required this.upOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      width: MediaQuery.of(context).size.width <= 1920
          ? ((1920 - 24) / 24 * 7) - 24 - 24 - 24
          : ((1920 - 24) / 24 * 7) - 24 - 24 - 24,
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
                    lastUseDate!,
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
                            containerName!,
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
                      onTap: upOnTap,
                      borderRadius: BorderRadius.circular(99),
                      child: SizedBox(
                        height: 26,
                        width: 26,
                        child: SvgPicture.asset('Svg/up_card.svg'),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    InkWell(
                      onTap: downOnTap,
                      borderRadius: BorderRadius.circular(99),
                      child: SizedBox(
                        height: 26,
                        width: 26,
                        child: SvgPicture.asset('Svg/down_card.svg'),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    InkWell(
                      onTap: removeOnTap,
                      borderRadius: BorderRadius.circular(99),
                      child: SizedBox(
                        height: 26,
                        width: 26,
                        child: SvgPicture.asset('Svg/minus_card.svg'),
                      ),
                    ),
                  ]),
            ]),
      ),
    );
  }
}
