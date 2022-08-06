import 'package:dashboard/core/constant/routs.dart';
import 'package:get/get.dart';
  import 'package:flutter/cupertino.dart';
 
abstract class LoginController extends GetxController {
  login();
  goToSignUp();
  goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  late TextEditingController email;
  late TextEditingController password;

  @override
  login() {}

  @override
  goToSignUp() {
    Get.toNamed(AppRoutes.signup);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
  
  @override
  goToForgetPassword() {
    Get.toNamed(AppRoutes.forgetPassword);
  }
}