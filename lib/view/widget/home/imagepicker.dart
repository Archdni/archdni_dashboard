// ignore_for_file: depend_on_referenced_packages
import 'package:dashboard/controller/home/pickimage_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppImagePicker
    extends GetView<ImagePickerControllerImp> {
  const AppImagePicker({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ImagePickerControllerImp
        imagePickerControllerImp =
        Get.put(ImagePickerControllerImp());
    return   Container(
        decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(12.0),
            color: Color.fromARGB(
                179, 204, 204, 204),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade200,
                offset:
                    const Offset(0.0, 0.5),
                blurRadius: 30.0,
              )
            ]),
        width:100,
        height: 100,
        child: GetBuilder<
            ImagePickerControllerImp>(
          init: imagePickerControllerImp,
          builder: (controller) => Center(
            child: imagePickerControllerImp
                    .itemPhotosWidgetList
                    .isEmpty
                ? Center(
                    child: MaterialButton(
                      onPressed:
                          imagePickerControllerImp
                              .pickPhotoFromGallery,
                      child: Container(
                        alignment: Alignment
                            .bottomCenter,
                        child: Center(
                          child:
                              Image.network(
                            "https://static.thenounproject.com/png/3322766-200.png",
                            height: 100.0,
                            width: 100.0,
                          ),
                        ),
                      ),
                    ),
                  )
                : Wrap(
                  spacing: 5.0,
                  direction:
                      Axis.horizontal,
                  alignment:
                      WrapAlignment
                          .spaceEvenly,
                  runSpacing: 10.0,
                  children:
                      imagePickerControllerImp
                          .itemPhotosWidgetList,
                ),
          ),
        ));
  }
}
