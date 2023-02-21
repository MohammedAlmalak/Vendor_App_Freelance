import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    Key? key,
    required this.width,
    required this.height,
    this.child,
    this.radius,
  }) : super(key: key);
  final double width;
  final double height;
  final Widget? child;
  final double? radius;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.8),
          blurRadius: 2.0,
        ),
      ], borderRadius: BorderRadius.all(Radius.circular(radius ?? 8.r))),
      child: Card(
        shadowColor: Colors.grey,
        margin: EdgeInsets.zero,
        child: child,
      ),
    );
  }
}
