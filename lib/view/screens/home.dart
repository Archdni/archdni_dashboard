import 'package:dashboard/controller/auth/signup_controller.dart';
import 'package:dashboard/core/constant/color.dart';
import 'package:dashboard/view/widget/home/homeform.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        title: Text('Home'.tr),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Row(
        children: [
          Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28 , vertical: 100),
                child: Column(
                   
            children: [
                Image.asset(
                  'assets/images/home.png',
                
                  height: Get.height *.45,
                  width: Get.width / .25, 
                ),
                Text(
                  "hello_again_thank you_for_your_time"
                      .tr,
                  style:
                      const TextStyle(fontSize: 24),
                ),
                Text(
                  "We appreciate your desire to communicate your association to the largest possible number of students, so we ask you to fill in data about your school accurately"
                      .tr,
                      textAlign: TextAlign.center,
                  style:
                      const TextStyle(fontSize: 18),
                ),
            ],
          ),
              )),
         const Expanded(
            child:  AppHomeForm()
          ),
        ],
      ),
    );
  }
}
