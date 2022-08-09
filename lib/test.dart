// ignore_for_file: depend_on_referenced_packages

import 'dart:typed_data';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'package:dashboard/controller/test.dart';
import 'dart:convert';
import 'package:get/get.dart';

import 'package:flutter/material.dart';

class ImageUploadScreen extends StatefulWidget {
  const ImageUploadScreen({Key? key})
      : super(key: key);

  @override
  State<ImageUploadScreen> createState() =>
      _ImageUploadScreenState();
}

class _ImageUploadScreenState
    extends State<ImageUploadScreen> {
  List<int>? _selectedFile;
  Uint8List? _bytesData;

  startWebFilePicker() async {
    html.FileUploadInputElement uploadInput =
        html.FileUploadInputElement();
    uploadInput.multiple = true;
    uploadInput.draggable = true;
    uploadInput.click();

    uploadInput.onChange.listen((event) {
      final files = uploadInput.files;
      final file = files![0];
      final reader = html.FileReader();

      reader.onLoadEnd.listen((event) {
        setState(() {
          _bytesData = Base64Decoder().convert(
              reader.result
                  .toString()
                  .split(",")
                  .last);
          _selectedFile = _bytesData;
        });
      });
      reader.readAsDataUrl(file);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
            child: Column(
          children: [
            Text('Let\'s upload Image'),
            SizedBox(height: 20),
            MaterialButton(
              color: Colors.pink,
              elevation: 8,
              highlightElevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(8)),
              textColor: Colors.white,
              child: Text("Select Photo"),
              onPressed: () {
                startWebFilePicker();
              },
            ),
            Divider(
              color: Colors.teal,
            ),
            _bytesData != null
                ? Image.memory(_bytesData!,
                    width: 200, height: 200)
                : Container(),
            MaterialButton(
              color: Colors.purple,
              elevation: 8,
              highlightElevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(8)),
              textColor: Colors.white,
              child: Text("Send file to server"),
              onPressed: () {
                /*   if (_selectedFile != null) {
                  uploadFile();
                }*/
              },
            ),
          ],
        )),
      ),
    );
  }
}

class AppImagePicker extends StatelessWidget {
  const AppImagePicker({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TestControllerImp testController =
        Get.put(TestControllerImp());
    return GetBuilder<TestController>(
      init: testController,
      builder: (controller) {
        return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
            child: Column(
          children: [
            Text('Let\'s upload Image'),
            SizedBox(height: 20),
            MaterialButton(
              color: Colors.pink,
              elevation: 8,
              highlightElevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(8)),
              textColor: Colors.white,
              child: Text("Select Photo"),
              onPressed: () {
                testController.startWebFilePicker();
              },
            ),
             
             testController.bytesData != null
                ? Image.memory( testController.bytesData!,
                    width: 100, height: 100)
                : Container(),
           /* MaterialButton(
              color: Colors.purple,
              elevation: 8,
              highlightElevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(8)),
              textColor: Colors.white,
              child: Text("Send file to server"),
              onPressed: () {
                testController.upload();
                /*   if (_selectedFile != null) {
                  uploadFile();
                }*/
              },
            ),*/
          ],
        )),
      ),
    );
      },
    );
  }
}
