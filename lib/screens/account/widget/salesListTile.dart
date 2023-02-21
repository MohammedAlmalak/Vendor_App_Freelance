import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vendor_app_freelance/primaryClasses/orders.dart';

class slaesListTile extends StatelessWidget {
  Order order;
  VoidCallback onListTap;
  slaesListTile({
    Key? key,
    required this.order,
    required this.onListTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => onListTap(),
      title: Text(
        order.orderProduct.productName! +
            " " +
            order.orderProduct.productBrand!.brandName!,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xff042C5C),
            fontSize: 15.sp),
      ),
      subtitle: Text(
        order.orderTime!,
        style: TextStyle(fontSize: 12.sp, color: Color(0xff042C5C)),
      ),
      trailing: Container(
        width: 100.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              order.orderProduct.productPrice.toString(),
              style: TextStyle(fontSize: 14.sp, color: Color(0xff042C5C)),
            ),
            SizedBox(
              width: 10.w,
            ),
            CircleAvatar(
              radius: 12,
              backgroundColor: Get.theme.primaryColor,
              child: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 15,
              ),
            )
          ],
        ),
      ),
    );
  }
}
