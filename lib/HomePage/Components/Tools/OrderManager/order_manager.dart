import 'package:flutter/material.dart';
import 'package:moonlighter/HomePage/Components/Tools/OrderManager/express_delivery_order.dart';
import 'package:moonlighter/HomePage/Components/Tools/OrderManager/product_order.dart';
import 'package:moonlighter/HomePage/Components/Tools/OrderManager/purchase_order.dart';
import 'package:moonlighter/HomePage/Components/Tools/OrderManager/resource_transfer_order.dart';
import 'package:moonlighter/HomePage/Components/Tools/OrderManager/shelf_order.dart';
import 'package:moonlighter/HomePage/Components/Tools/OrderManager/transaction_order.dart';
import '../../../../PublicWidgets/CommitTitle/commit_title.dart';
import '../../../../Config/index.dart';
import './order_button.dart';

class OrderManager extends StatefulWidget {
  const OrderManager({super.key});

  @override
  State<OrderManager> createState() => _OrderManagerState();
}

class _OrderManagerState extends State<OrderManager> {
  int? selectIndex;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        CommitTitle(iconPath: 'Svg/order_tool.svg', title: KString.addOrder, commit: commit, cancel: cancel,),
        const SizedBox(
          height: 16,
        ),
        Wrap(
          spacing: 24,
          runSpacing: 0,
          alignment: WrapAlignment.start,
          children: [
            OrderButton(
                isSelect: selectIndex == 0 ? true : false,
                onTap: () {
                  onTap(0);
                },
                path: 'Svg/Shelf_order.svg',
                name: '上架订单'),
            OrderButton(
                isSelect: selectIndex == 1 ? true : false,
                onTap: () {
                  onTap(1);
                },
                path: 'Svg/purchase_order.svg',
                name: '采购订单'),
            OrderButton(
                isSelect: selectIndex == 2 ? true : false,
                onTap: () {
                  onTap(2);
                },
                path: 'Svg/product_order.svg',
                name: '制作订单'),
            OrderButton(
                isSelect: selectIndex == 3 ? true : false,
                onTap: () {
                  onTap(3);
                },
                path: 'Svg/transaction_order.svg',
                name: '交易订单'),
            OrderButton(
                isSelect: selectIndex == 4 ? true : false,
                onTap: () {
                  onTap(4);
                },
                path: 'Svg/express_delivery_order.svg',
                name: '快递订单'),
            OrderButton(
                isSelect: selectIndex == 5 ? true : false,
                onTap: () {
                  onTap(5);
                },
                path: 'Svg/resource_transfer_order.svg',
                name: '金币订单'),
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        SizedBox(
              height: MediaQuery.of(context).size.height -
          24 -
          24 -
          46 -
          (55 + 8 + 17 + 16) * 3 -
          32 -
          46 -
          (55 + 8 + 17 + 16) - 16,
              child: SingleChildScrollView(
                child: selectIndex == 0
                    ? ShelfOrder()
                    : selectIndex == 1
                        ? PurchaseOrder()
                        : selectIndex == 2
                            ? ProductOrder()
                            : selectIndex == 3
                                ? TransactionOrder()
                                : selectIndex == 4
                                    ? ExpressDeliveryOrder()
                                    : selectIndex == 5
                                        ? ResourceTransferOrder()
                                        : SizedBox(),
              ),
        )
      ],
    );
  }

  void onTap(int index) {
    selectIndex = index;
    refreshUi();
  }

  void refreshUi() {
    setState(() {});
  }

  void commit(){

  }

  void cancel(){

  }

}
