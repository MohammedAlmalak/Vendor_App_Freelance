import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vendor_app_freelance/services/theme/app_assets.dart';

import '../../../common/card_widget.dart';

class FeedBackCard extends StatelessWidget {
  FeedBackData feedData;
  FeedBackCard({Key? key, required this.feedData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      height: 180.h,
      width: 0,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 8.w, top: 7.h, left: 8.w),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(),
                      SizedBox(width: 15.w),
                      RichText(
                        text: TextSpan(
                            text: feedData.name,
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontFamily: 'Cairo',
                              color: Color(0xff575757),
                            ),
                            children: [
                              TextSpan(
                                  text: '\n ${feedData.date}',
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    color: Color(0xff575757),
                                  ))
                            ]),
                      ),
                    ],
                  ),
                  Row(children: [
                    Text(feedData.rating),
                    Icon(Icons.star, color: Colors.yellow),
                  ]),
                ]),
          ),
          SizedBox(height: 7.h),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Container(
                  width: 225.w,
                  //height: 49.h,

                  child: Text(
                    feedData.feedBacktxt,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Color(0xff575757),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Container(
                width: 67.w,
                height: 41.h,
                color: Color(0xff575757).withOpacity(0.1),
                child: Image.asset(
                  feedData.feedBackImg,
                  scale: 6.sp,
                ),
              ),
            )
          ]),
        ],
      ),
    );
  }
}

class FeedBackData {
  String name;
  String date;
  String rating;
  String feedBacktxt;
  String feedBackImg;
  FeedBackData({
    required this.name,
    required this.date,
    required this.rating,
    required this.feedBacktxt,
    required this.feedBackImg,
  });
}
