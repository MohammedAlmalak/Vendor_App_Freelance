// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:vendor_app_freelance/popUpsDialogs/cancellationReasonDialog/view/cancellationDialog.dart';
// import '../../../services/theme/app_assets.dart';
// import '../../home/widget/card_detail.dart';
// import 'package:getwidget/getwidget.dart';

// class OrderetailCard extends StatelessWidget {
//   OrderetailCard({
//     Key? key,
//     this.data,
//     this.itemName,
//     this.brandName,
//     this.withTimerAndButtom = false,
//     this.image,
//     this.sizedBox,
//   }) : super(key: key);

//   final List<RowDetail>? data;
//   final String? itemName;
//   final String? brandName;
//   final String? image;
//   final bool? withTimerAndButtom;
//   final double? sizedBox;
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       shadowColor: Colors.grey,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(8.r),
//       ),
//       margin: EdgeInsets.zero,
//       child: Row(children: [
//         Expanded(
//           flex: 3,
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 10.w),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 DefaultTextStyle(
//                   style: TextStyle(fontSize: 15.sp, color: Color(0xff575757)),
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 8.w),
//                     child: Row(
//                       children: [
//                         Text(itemName!),
//                         SizedBox(width: 15.w),
//                         Text(brandName!),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Text(
//                   '      السعر 70 ر.س',
//                   style: TextStyle(fontSize: 12.sp, color: Color(0xff575757)),
//                 ),
//                 SizedBox(height: sizedBox ?? 30.h),
//                 ...List.generate(
//                   data!.length,
//                   (index) => Padding(
//                     padding: EdgeInsets.only(top: 3.h),
//                     child: DefaultTextStyle(
//                       style:
//                           TextStyle(fontSize: 13.sp, color: Color(0xff575757)),
//                       child: /* RowOfDetails(row[index], index) */
//                           Row(
//                         children: [
//                           Container(
//                               width: 50.w,
//                               height: 20.h,
//                               child: Text(data![index].label!)),
//                           SizedBox(width: 30.w),
//                           data![index].icon!,
//                           SizedBox(width: 14.w),
//                           Text(data![index].text!),
//                           SizedBox(width: 14.w),
//                           if (withTimerAndButtom!)
//                             if (index + 1 == data!.length)
//                               Container(
//                                 width: 70.w,
//                                 height: 20.h,
//                                 decoration: BoxDecoration(
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(4.r)),
//                                     border: Border.all(
//                                         width: 0, color: Color(0xffDFE3E9))),
//                                 /*   decoration: BoxDecoration(
//                                   border: Border.all(width: 0),
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(4.r)),
//                                 ), */
//                                 child: DropdownButton(
//                                     isExpanded: true,
//                                     underline: Container(),
//                                     alignment: Alignment.center,
//                                     iconEnabledColor: Get.theme.primaryColor,
//                                     iconDisabledColor: Get.theme.primaryColor,
//                                     dropdownColor: Colors.white,
//                                     items: items,
//                                     value: 's',
//                                     onChanged: (v) {}),
//                               ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 if (withTimerAndButtom!) SizedBox(height: 10.w),
//                 if (withTimerAndButtom!)
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 14.w),
//                     child: Row(
//                       children: [
//                         Container(
//                           width: 68.w,
//                           height: 22.h,
//                           child: GFButton(
//                             color: Color(0xff4EFF78),
//                             onPressed: () {},
//                             text: "قبول",
//                             textStyle: TextStyle(fontSize: 12.sp),
//                             icon: Icon(
//                               Icons.check_rounded,
//                               size: 20.sp,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                         SizedBox(width: 13.w),
//                         Container(
//                           width: 68.w,
//                           height: 22.h,
//                           child: GFButton(
//                             color: Color.fromARGB(218, 241, 52, 52),
//                             onPressed: () {
//                               cancellationReasonDialog();
//                             },
//                             text: "الغاء",
//                             textStyle: TextStyle(fontSize: 12.sp),
//                             icon: Icon(
//                               Icons.close,
//                               size: 20.sp,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   )
//               ],
//             ),
//           ),
//         ),
//         Expanded(
//             child: Column(
//           children: [
//             SizedBox(height: 15.h),
//             Image.asset(
//               image ?? AppAssets.tshertjacket,
//               width: 57.w,
//               height: 78.h,
//             ),
//           ],
//         ))
//       ]),
//     );
//   }

//   final List<DropdownMenuItem<String>>? items = [
//     DropdownMenuItem(
//         value: 's',
//         child: Center(
//             child: Text(
//           '30 د',
//           style: TextStyle(fontSize: 13.sp),
//         ))),
//     DropdownMenuItem(value: 'a', child: Center(child: Text('60 د'))),
//     DropdownMenuItem(value: 'sa', child: Center(child: Text('15 د'))),
//   ];
//   /* Row RowOfDetails(RowDetail data, int index) {
//     List<DropdownMenuItem<String>>? items = [
//       DropdownMenuItem(value: 's', child: Center(child: Text('30 د'))),
//       DropdownMenuItem(value: 'a', child: Center(child: Text('60 د'))),
//       DropdownMenuItem(value: 'sa', child: Center(child: Text('15 د'))),
//     ];
//     return Row(
//       children: [
//         Container(width: 50.w, height: 20.h, child: Text(data.label!)),
//         SizedBox(width: 30.w),
//         data.icon!,
//         SizedBox(width: 14.w),
//         Text(data.text!),])
//         SizedBox(width: 14.w),
//         if (index + 1 == row.length)
//           Container(
//             width: 70.w,
//             height: 20.h,
//             decoration: BoxDecoration(
//               border: Border.all(width: 0.2),
//               borderRadius: BorderRadius.all(Radius.circular(4.r)),
//             ),
//             child: DropdownButton(
//                 isExpanded: true,
//                 alignment: Alignment.center,
//                 iconEnabledColor: Get.theme.primaryColor,
//                 iconDisabledColor: Get.theme.primaryColor,
//                 dropdownColor: Colors.white,
//                 items: items,
//                 value: 's',
//                 onChanged: (v) {}),
//           ),
//       ],
//     );
//   }
//  */
// }
