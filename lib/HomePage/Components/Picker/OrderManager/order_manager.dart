import 'package:flutter/material.dart';
import '../../../../ToolWidgets/rectangle_cliper.dart';
import './product_order.dart';

class PickerOrderManager extends StatefulWidget {
  const PickerOrderManager({super.key});

  @override
  State<PickerOrderManager> createState() => _PickerOrderManagerState();
}

class _PickerOrderManagerState extends State<PickerOrderManager> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 24 - 24,
      child: ClipPath(
        clipper: RectangleClipper(),
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ProductOrder(orderId: '123', orderTime: '2023/8/27', orderStatus: '执行中', sourceId: 'A-123', sourceName: '沼泽小鳄', targetId: 'B-123', targetName: '草原小马', 

              )
            ],
          ),
        ),
      ),
    );
  }
}
