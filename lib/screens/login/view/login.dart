import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:vendor_app_freelance/services/theme/app_assets.dart';

import '../../../routes/routes_name.dart';
import '../../../services/translate/translate.dart';
import '../controller/loginController.dart';

class login extends StatelessWidget {
  const login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<loginController>(
        init: loginController(),
        builder: (controller) => ListView(children: [
          SizedBox(
            height: height,
            child: Stack(alignment: Alignment.center, children: [
              Positioned(
                top: 0,
                child: Container(
                    padding: const EdgeInsets.only(top: 20),
                    alignment: Alignment.topCenter,
                    width: width,
                    height: .5.sh,
                    color: const Color(0xFFF26511),
                    child: Image.asset(AppAssets.logo)),
              ),
              Positioned(
                  top: 130,
                  child: Container(
                    width: width,
                    // height: height * .8,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(70),
                          topRight: Radius.circular(70),
                        )),
                    child: Column(
                        //scrollDirection: Axis.vertical,
                        // shrinkWrap: false,
                        children: [
                          SizedBox(
                            height: 25.h,
                          ),
                          Center(
                              child: Text(
                            "login".tr,
                            // "تسجيل الدخول",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          )),
                          SizedBox(
                            height: 30.h,
                          ),
                          Form(
                              key: controller.formState,
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(40, 5, 40, 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "name".tr,
                                      //"الإسم",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.grey,
                                            blurRadius: 2.0,
                                            spreadRadius: 0.0,

                                            offset: Offset(1,
                                                2), // shadow direction: bottom right
                                          )
                                        ],
                                        border: Border.all(
                                            width: .5,
                                            color: const Color(0xFFBDBDBD)),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: TextFormField(
                                        validator: controller.emailValidator,
                                        onSaved: (val) {
                                          controller.Email = val;
                                        },
                                        cursorColor: const Color(0xFFF26511),
                                        decoration: const InputDecoration(

                                            // border: new OutlineInputBorder(
                                            //   borderRadius: new BorderRadius.circular(15.0),
                                            //   borderSide: new BorderSide(),
                                            // ),
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20)),
                                                borderSide: BorderSide(
                                                    color: Colors.white)),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20)),
                                                borderSide: BorderSide(
                                                  color: Colors.white,
                                                )),
                                            errorBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20)),
                                                borderSide: BorderSide(
                                                  color: Color(0xFFF26511),
                                                )),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                20)),
                                                    borderSide: BorderSide(
                                                      color: Color(0xFFF26511),
                                                    )),
                                            prefixIcon: Icon(
                                              Icons.person,
                                              color: Colors.grey,
                                            ),
                                            // labelText: 'Email',
                                            // label: Container(
                                            //     decoration: BoxDecoration(
                                            //         border:
                                            //             Border.all(color: Colors.blueAccent),
                                            //         borderRadius: BorderRadius.all(
                                            //             Radius.circular(10))),
                                            //     child: Text("Email")),
                                            //hintText: 'Enter valid email id as abc@gmail.com',
                                            // floatingLabelStyle: TextStyle(
                                            //     backgroundColor: Color(0xFFF26511),
                                            //     color: Colors.white),
                                            labelStyle:
                                                TextStyle(color: Colors.grey)),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Text(
                                      "password".tr,
                                      // "كلمة المرور",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.grey,
                                            blurRadius: 2.0,
                                            spreadRadius: 0.0,

                                            offset: Offset(1,
                                                2), // shadow direction: bottom right
                                          )
                                        ],
                                        border: Border.all(
                                            width: .5,
                                            color: const Color(0xFFBDBDBD)),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: TextFormField(
                                        validator: controller.passwordValidator,
                                        onSaved: (val) {
                                          controller.Password = val;
                                        },
                                        obscureText: controller.showPassword,
                                        cursorColor: const Color(0xFFF26511),
                                        decoration: InputDecoration(
                                            enabledBorder:
                                                const OutlineInputBorder(
                                                    borderRadius: BorderRadius.all(
                                                        Radius.circular(20)),
                                                    borderSide: BorderSide(
                                                        color: Colors.white)),
                                            focusedBorder:
                                                const OutlineInputBorder(
                                                    borderRadius: BorderRadius.all(
                                                        Radius.circular(20)),
                                                    borderSide: BorderSide(
                                                      color: Colors.white,
                                                    )),
                                            errorBorder:
                                                const OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                20)),
                                                    // borderRadius: BorderRadius.circular(10),
                                                    borderSide: BorderSide(
                                                      color: Color(0xFFF26511),
                                                    )),
                                            focusedErrorBorder:
                                                const OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                20)),
                                                    // borderRadius: BorderRadius.circular(10),
                                                    borderSide: BorderSide(
                                                      color: Color(0xFFF26511),
                                                    )),
                                            suffixIcon: GestureDetector(
                                              onTap: controller
                                                  .togglePasswordVisibility,
                                              child: controller.showPassword
                                                  ? const Icon(
                                                      Icons.visibility_off,
                                                      color: Colors.grey)
                                                  : const Icon(
                                                      Icons.visibility,
                                                      color: Colors.grey,
                                                    ),
                                            ),
                                            prefixIcon: const Icon(
                                              Icons.lock,
                                              color: Colors.grey,
                                            ),
                                            // labelText: 'Password',
                                            //hintText: 'Enter secure password',
                                            // floatingLabelStyle: const TextStyle(
                                            //     backgroundColor: Color(0xFFF26511),
                                            //     color: Colors.white),
                                            labelStyle: const TextStyle(
                                                color: Colors.grey)),
                                      ),
                                    ),
                                    ListTile(
                                      horizontalTitleGap: 0,
                                      contentPadding: const EdgeInsets.all(0),
                                      leading: Checkbox(
                                          activeColor: const Color(0xFFF26511),
                                          value: controller.remberPassword,
                                          onChanged: (val) {
                                            controller.changeRemberPassword();
                                          }),
                                      title: Text(
                                        "rememberme".tr,
                                        //"تذكر كلمة السر",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 40),
                            child: RoundedLoadingButton(
                              color: const Color(0xFFF26511),
                              borderRadius: 10,
                              height: 50,
                              width: width,
                              successIcon: Icons.check_circle_outline_outlined,
                              failedIcon: Icons.cancel,
                              duration: const Duration(seconds: 2),
                              // style: ElevatedButton.styleFrom(
                              //   primary: Color(0xFF005b51),
                              // ),
                              controller: controller.btnController,
                              onPressed: () {
                                //  var user = await signIn();
                                //  if (user != null) {
                                // pushNewScreen(
                                //   context,
                                //   screen: bottomBar(),
                                //   withNavBar: true,
                                //   pageTransitionAnimation:
                                //       PageTransitionAnimation.scale,
                                // );

                                Get.offNamed(Routes.NavBar);
                                controller.btnController.success();
                                //   }
                              },
                              child: Text(
                                'loginbtn'.tr,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Center(
                              child: Text(
                            "forgotpass".tr,
                            // "نسيت كلمة المرور؟",
                            style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFFF26511),
                                decoration: TextDecoration.underline),
                          )),
                        ]),
                  )),
            ]),
          ),
        ]),
      ),
    );
  }
}
