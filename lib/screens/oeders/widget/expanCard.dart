import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExpanCard extends StatelessWidget {
  final Widget cardHeader;
  final Widget cardBody;
  final Widget Img;
  final bool? isExpanded;
  final VoidCallback onCardTap;
  final String? orderStatus;
  ExpanCard({
    Key? key,
    required this.cardHeader,
    required this.cardBody,
    required this.Img,
    this.isExpanded,
    required this.onCardTap,
    this.orderStatus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onCardTap(),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 1500),
        height: isExpanded == false ? 160.h : 350.h,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(.5), blurRadius: 2.0,
                offset: Offset(1, 2), // shadow direction: bottom right
              )
            ],
            border: orderStatus == "ملغى"
                ? Border.all(width: 2.5, color: Colors.red)
                : null,
            borderRadius: BorderRadius.all(Radius.circular(8.r))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    cardHeader,
                    isExpanded == true ? cardBody : Container()
                  ]),
            ),
            Expanded(
                child: SizedBox(
              width: 100.w,
              height: 100.h,
              child: Img,
            ))
          ],
        ),
      ),
    );
  }
}
