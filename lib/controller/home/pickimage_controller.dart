// ignore_for_file: depend_on_referenced_packages

import 'package:get/get.dart';
import 'dart:io';
import 'dart:io' show File;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:oktoast/oktoast.dart';
import 'package:uuid/uuid.dart';

abstract class ImagePickerController
    extends GetxController {
  RxList<Widget> itemPhotosWidgetList = <Widget>[].obs;

  final ImagePicker picker = ImagePicker();
  File? file;
  List<XFile>? photo = <XFile>[];
  List<XFile> itemImagesList = <XFile>[];

  List<String> downloadUrl = <String>[];

  bool uploading = false;
  pickPhotoFromGallery();
  upload();
  addImage();
  uplaodImageAndSaveItemInfo();
  uploadImageToStorage(
      PickedFile? pickedFile, String productId);
}

class ImagePickerControllerImp
    extends ImagePickerController {
  @override
  pickPhotoFromGallery() async {
    photo = await picker.pickMultiImage();
    if (photo != null) {
      itemImagesList = itemImagesList + photo!;
      addImage();
      photo!.clear();
    }
    update();
  }

  Future<String>
      uplaodImageAndSaveItemInfo() async {
    uploading = true;

    PickedFile? pickedFile;
    String? productId = const Uuid().v4();
    for (int i = 0;
        i < itemImagesList.length;
        i++) {
      file = File(itemImagesList[i].path);
      pickedFile = PickedFile(file!.path);

      await uploadImageToStorage(
          pickedFile, productId);
    }
    update();
    return productId;
  }

  @override
  upload() async {
    // ignore: unused_local_variable
    String productId =
        await uplaodImageAndSaveItemInfo();

    uploading = false;

    showToast("Image Uploaded Successfully");
    update();
  }

  @override
  uploadImageToStorage(PickedFile? pickedFile,
      String productId) async {
    String? pId = const Uuid().v4();
    Reference reference = FirebaseStorage.instance
        .ref()
        .child('Items/$productId/product_$pId');
    await reference.putData(
      await pickedFile!.readAsBytes(),
      SettableMetadata(contentType: 'image/jpeg'),
    );
    String value =
        await reference.getDownloadURL();
    downloadUrl.add(value);
    update();
  }

  @override
  addImage() {
  
      for (var bytes in photo!) {
        itemPhotosWidgetList.add(Padding(
          padding: const EdgeInsets.all(1.0),
          child: Container(
            height: 90.0,
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                child: kIsWeb
                    ? Image.network(
                        File(bytes.path).path)
                    : Image.file(
                        File(bytes.path),
                      ),
              ),
            ),
          ),
        ));
   update();   }
    
    
  }
}
