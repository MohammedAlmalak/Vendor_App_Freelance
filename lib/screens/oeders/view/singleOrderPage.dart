import 'package:flutter/material.dart';
import 'package:vendor_app_freelance/common/backButton.dart';
import 'package:vendor_app_freelance/primaryClasses/orders.dart';

import '../../../common/scafold_appbar_drawer.dart';
import '../../orderStatusDetails/widget/statusDetailCard.dart';

class singleOrderPage extends StatelessWidget {
  Order ord;
  singleOrderPage({Key? key, required this.ord}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScafoldWidget(
      title: 'الطلبات',
      body: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(margin: EdgeInsets.all(15), child: backButton()),
          ],
        ),
        StatusDetailCard(
          order: ord,
        ),
      ]),
    );
  }
}
