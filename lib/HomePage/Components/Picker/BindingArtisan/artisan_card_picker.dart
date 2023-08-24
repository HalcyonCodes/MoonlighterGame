import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../Config/index.dart';

class PickerRoleCard extends StatelessWidget {
  final String? id;
  final String? category;
  final String? name;
  final String? profile;
  final Function()? addOnTap;


  const PickerRoleCard({
    super.key,
    required this.id,
    required this.category,
    required this.name,
    required this.profile,
    required this.addOnTap,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      width: MediaQuery.of(context).size.width <= 1920
          ? (1920 - 24) / 24 * 8 - 24
          : (1920 - 24) / 24 * 8 - 24,
      decoration: KDecoration.cardDecoration,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: SizedBox(
          width: MediaQuery.of(context).size.width <= 1920
              ? (1920 - 24) / 24 * 7 - 24 - 24 - 24
              : (1920 - 24) / 24 * 7 - 24 - 24 - 24,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    id!,
                    style: KFont.cardProfileStyle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Expanded(child: SizedBox()),
                  Text(
                    category!,
                    style: KFont.cardProfileStyle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          name!,
                          style: KFont.cardTitleStyle,
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          profile!,
                          style: KFont.cardProfileStyle,
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                        ),
                      ],
                    ),
                    const SizedBox(width: 16,),
                    const Expanded(child: SizedBox()),
                    InkWell(
                      onTap: addOnTap,
                      borderRadius: BorderRadius.circular(99),
                      child: SizedBox(
                        height: 26,
                        width: 26,
                        child: SvgPicture.asset('Svg/plus_card.svg'),
                      ),
                    ),

                  ])
            ],
          ),
        ),
      ),
    );
  }
}
