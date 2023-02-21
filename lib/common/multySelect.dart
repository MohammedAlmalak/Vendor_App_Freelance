import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class choices {
  final int? id;
  final String? name;

  choices({
    this.id,
    this.name,
  });
}

class MultySelectWidget extends StatelessWidget {
  Text? title;
  List<choices> optionsList;
  Function(List<choices?>)? selectedOptions;
  final void Function(List<choices?>)? onConfirm;
  MultySelectWidget({
    Key? key,
    this.title,
    required this.optionsList,
    this.selectedOptions,
    this.onConfirm,
    this.selectedItems,
  }) : super(key: key);

  List<choices?>? selectedItems;
  late final _items = optionsList
      .map((choice) => MultiSelectItem<choices?>(choice, choice.name!))
      .toList();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (title != null) title! else Container(),
        SizedBox(width: 25.w),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Color(0xffDFE3E9))),
            child: MultiSelectDialogField<choices?>(
              // initialChildSize: 0.4,
              listType: MultiSelectListType.CHIP,
              searchable: true,
              cancelText: Text('إلغاء'),
              confirmText: Text('حسنا'),
              buttonText: Text("اختر"),
              title: Text('الخيارات'),
              buttonIcon: Icon(
                Icons.arrow_drop_down_outlined,
                color: Get.theme.primaryColor,
              ),
              //title: Text("Animals"),
              items: _items,
              onConfirm: onConfirm ??
                  (values) {
                    selectedItems = values;
                    selectedOptions!(selectedItems!);
                  },
              chipDisplay: MultiSelectChipDisplay(
                onTap: (value) {
                  selectedItems!
                      .removeWhere((element) => element!.id == value!.id);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
