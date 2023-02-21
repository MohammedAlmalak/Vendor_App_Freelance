import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vendor_app_freelance/services/theme/app_assets.dart';

class orderButtons extends StatelessWidget {
  String txt;
  final VoidCallback? onTap;
  final Color? backGroungColor;
  final double? btnWidth;
  orderButtons(
      {Key? key,
      required this.txt,
      this.onTap,
      this.backGroungColor,
      this.btnWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: btnWidth ?? 150.w,
        height: 25.h,
        child: ElevatedButton(
          onPressed: () => onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.check_circle_rounded,
                color: Colors.white,
                size: 18.sp,
              ),
              SizedBox(
                width: 5.w,
              ),
              Text(
                txt,
                style: TextStyle(fontSize: 10.sp, color: Colors.white),
              ),
            ],
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed))
                  return Theme.of(context).colorScheme.primary.withOpacity(0.5);
                return backGroungColor != null
                    ? backGroungColor
                    : Color(0xffEF723C); // Use the component's default.
              },
            ),
          ),
        ),
      ),
    );
  }
}
