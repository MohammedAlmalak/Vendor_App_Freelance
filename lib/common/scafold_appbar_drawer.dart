import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'appbar_widget.dart';
import 'drawer_widget.dart';

class ScafoldWidget extends StatelessWidget {
  const ScafoldWidget(
      {Key? key,
      this.title,
      this.backgroundColor,
      required this.body,
      this.elevation})
      : super(key: key);
  final String? title;
  final Color? backgroundColor;
  final Widget body;
  final double? elevation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: title ?? 'home'.tr,
        elevation: elevation ?? 1,
      ),
      drawer: Drawer(
        child: DrawerWidget(),
      ),
      backgroundColor: backgroundColor ?? Color(0xffFCFCFC),
      body: body,
    );
  }
}
