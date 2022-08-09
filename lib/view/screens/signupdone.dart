// ignore_for_file: depend_on_referenced_packages

import 'package:dashboard/core/constant/color.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SignUpDone extends StatelessWidget {
  const SignUpDone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        title: Text('SignUpDone'.tr),
        centerTitle: true ,
      ),
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('SignUpDone'.tr , style:const TextStyle(fontSize: 28),),
         const SizedBox(height: 20),
          Text("we will verify your account and then you will be able to login".tr , style:const TextStyle(fontSize: 18),),
        ],
      ),
    );
  }
}