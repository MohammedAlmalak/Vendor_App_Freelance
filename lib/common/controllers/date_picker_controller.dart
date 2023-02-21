import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DateTimePickerController extends GetxController {
  // String selectedDate = DateFormat('yyyy-MM-dd - EEEE').format(DateTime.now());
  String selectedDate = DateFormat.yMEd('ar').format(DateTime.now());
  Future<void> selectDate(BuildContext context) async {
    var newFormat = new DateFormat.yMEd(Get.locale!.languageCode);

    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      selectedDate = newFormat.format(picked);
      update();
    }
  }
}
