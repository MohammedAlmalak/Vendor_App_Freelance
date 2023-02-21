import 'package:flutter/material.dart';
import 'package:get/get.dart';

class backButton extends StatelessWidget {
  const backButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => Navigator.of(context).pop()
        //Get.back()
        ,
        child: Icon(Icons.arrow_forward_ios));
  }
}
