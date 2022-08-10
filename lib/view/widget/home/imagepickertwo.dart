// ignore_for_file: depend_on_referenced_packages
import 'package:dashboard/controller/home/pickimagetwo_controller.dart';
import 'package:dashboard/core/constant/color.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AppImagePickerTwo extends StatelessWidget {
  const AppImagePickerTwo({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ImagePickerTwoControllerImp
        imagePickerControllerImp =
        Get.put(ImagePickerTwoControllerImp());
    return GetBuilder<
        ImagePickerTwoControllerImp>(
      init: imagePickerControllerImp,
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.symmetric(
              vertical: 20),
          child: Center(
              child: Row(
            mainAxisAlignment:
                MainAxisAlignment.start,
            children: [
              MaterialButton(
                color: AppColor.secoundry,
                elevation: 8,
                highlightElevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(8)),
                textColor: Colors.white,
                child: const Text("Select Photo"),
                onPressed: () {
                  imagePickerControllerImp
                      .startWebFilePicker();
                },
              ),
              imagePickerControllerImp
                          .bytesDataTwo !=
                      null
                  ? Padding(
                      padding: const EdgeInsets
                              .symmetric(
                          horizontal: 20),
                      child: Image.memory(
                          imagePickerControllerImp
                              .bytesDataTwo!,
                          width: 50,
                          height: 50),
                    )
                  : Container()
            ],
          )),
        );
      },
    );
  }
}
