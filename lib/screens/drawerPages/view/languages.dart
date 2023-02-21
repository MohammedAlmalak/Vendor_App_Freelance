import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vendor_app_freelance/common/scafold_appbar_drawer.dart';

import '../../../services/translate/translate.dart';

class languages extends StatelessWidget {
  const languages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScafoldWidget(
        title: "اللغات",
        body: ListView.separated(
            //physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            primary: true,
            separatorBuilder: (c, i) => Divider(
                  endIndent: 10.w,
                  height: 5,
                  indent: 10.w,
                  color: Colors.black,
                ),
            itemBuilder: (c, i) => RadioListTile(
                title: Text(TranslationService.languagesName[i]),
                controlAffinity: ListTileControlAffinity.trailing,
                value: TranslationService.languages[i],
                groupValue: GetStorage().read<String>('language'),
                onChanged: (x) {
                  Get.find<TranslationService>().updateLocale(x);
                }),
            itemCount: TranslationService.languages.length));
  }
}
