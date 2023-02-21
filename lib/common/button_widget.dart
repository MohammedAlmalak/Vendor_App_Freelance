import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CommonButton extends StatelessWidget {
  CommonButton({
    Key? key,
    required this.text,
    this.txtStyle,
    required this.width,
    required this.height,
    this.onTap,
    this.backGroungColor,
  }) : super(key: key);
  final String text;
  final TextStyle? txtStyle;
  final double width;
  final double height;
  final VoidCallback? onTap;
  final Color? backGroungColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: () => onTap!(),
        child: Text(
          text,
          style: txtStyle != null
              ? txtStyle
              : TextStyle(fontSize: 10.sp, color: Colors.white),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed))
                return Theme.of(context).colorScheme.primary.withOpacity(0.5);
              return backGroungColor != null
                  ? backGroungColor
                  : Get.theme.primaryColor; // Use the component's default.
            },
          ),
        ),
      ),
    );
  }
}
