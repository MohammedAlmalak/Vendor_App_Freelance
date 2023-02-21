import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class loginController extends GetxController {
  var Email, Password;
  bool showPassword = true;
  GlobalKey<FormState> formState = new GlobalKey<FormState>();
  final RoundedLoadingButtonController btnController =
      RoundedLoadingButtonController();
  void togglePasswordVisibility() {
    showPassword = !showPassword;
    update();
  }

  final emailValidator = MultiValidator([
    RequiredValidator(errorText: 'Email is required'),
    EmailValidator(errorText: 'enter a valid email address'),
  ]);
  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'password is required'),
  ]);
  bool remberPassword = false;
  void changeRemberPassword() {
    remberPassword = !remberPassword;
    update();
  }
}
