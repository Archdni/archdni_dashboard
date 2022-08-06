import 'package:dashboard/core/constant/routs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
 
abstract class SignUpController
    extends GetxController {
  signUp();
  goToSignIn();
}

class SignUpControllerImp
    extends SignUpController {
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController confirmPassword;
  late TextEditingController password;

  @override
  signUp() {
    if (username.text.isEmpty ||
        email.text.isEmpty ||
        password.text.isEmpty ||
        confirmPassword.text.isEmpty) {
      Get.snackbar(
        "Error".tr,
        "please fill all the fields".tr,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } else if (password.text.length <= 6) {
      Get.snackbar(
        "Error".tr,
        "Password must be at least 6 characters".tr,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );}
     else if (password.text !=
        confirmPassword.text) {
      Get.snackbar(
        "Error".tr,
        "password does not match".tr,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } else {
      Get.offAllNamed(AppRoutes.emailVerify);
       
    }
  }

  @override
  goToSignIn() {
    Get.offNamed(AppRoutes.login);
  }

  @override
  void onInit() {
    username = TextEditingController();
    confirmPassword = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    confirmPassword.dispose();
    password.dispose();
    super.dispose();
  }
}
