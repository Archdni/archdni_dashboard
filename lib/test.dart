// ignore_for_file: depend_on_referenced_packages
  import 'package:dashboard/controller/home/pickimage_controller.dart';
import 'package:flutter/material.dart';
  import 'package:get/get.dart';
/*
class UploadPage extends StatefulWidget {
  const UploadPage({Key? key}) : super(key: key);

  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  ImagePickerControllerImp  imagePickerControllerImp =
      Get.put(ImagePickerControllerImp());
  

  @override
  Widget build(BuildContext context) {
    double _screenwidth = MediaQuery.of(context).size.width,
        _screenheight = MediaQuery.of(context).size.height;
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth < 480) {
        return displayPhoneUploadFormScreen(_screenwidth, _screenheight);
      } else {
        return displayWebUploadFormScreen(_screenwidth, _screenheight);
      }
    });
  }

  displayPhoneUploadFormScreen(_screenwidth, _screenheight) {
    return Container();
  }

  displayWebUploadFormScreen(_screenwidth, _screenheight) {
    return OKToast(
        child: Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 100.0,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: Colors.white70,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    offset: const Offset(0.0, 0.5),
                    blurRadius: 30.0,
                  )
                ]),
            width: _screenwidth * 0.7,
            height: 300.0,
            child: Center(
              child: imagePickerControllerImp.itemPhotosWidgetList.isEmpty
                  ? Center(
                      child: MaterialButton(
                        onPressed: imagePickerControllerImp.pickPhotoFromGallery ,
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          child: Center(
                            child: Image.network(
                              "https://static.thenounproject.com/png/3322766-200.png",
                              height: 100.0,
                              width: 100.0,
                            ),
                          ),
                        ),
                      ),
                    )
                  : SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Wrap(
                        spacing: 5.0,
                        direction: Axis.horizontal,
                        children: imagePickerControllerImp.itemPhotosWidgetList,
                        alignment: WrapAlignment.spaceEvenly,
                        runSpacing: 10.0,
                      ),
                    ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 50.0,
                  left: 100.0,
                  right: 100.0,
                ),
                child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 15.0),
                    color: const Color.fromRGBO(0, 35, 102, 1),
                    onPressed: imagePickerControllerImp.uploading ? null : () => imagePickerControllerImp.upload(),
                    child: imagePickerControllerImp.uploading
                        ? const SizedBox(
                            child: CircularProgressIndicator(),
                            height: 15.0,
                          )
                        : const Text(
                            "Add",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
              ),
            ],
          ),
        ],
      ),
    ));
  }

  
}*/

////////////////////////////////
class AppImagePicker1
    extends GetView<ImagePickerControllerImp> {
  const AppImagePicker1({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ImagePickerControllerImp
        imagePickerControllerImp =
        Get.put(ImagePickerControllerImp());
    return   Column(
    children: [
 
      Container(
          decoration: BoxDecoration(
             
              borderRadius:
                  BorderRadius.circular(12.0),
              color: Color.fromARGB(179, 204, 204, 204),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade200,
                  offset:
                      const Offset(0.0, 0.5),
                  blurRadius: 30.0,
                )
              ]),
          width: 250,
          height: 50,
          child: GetBuilder <ImagePickerControllerImp>(
            init: imagePickerControllerImp,
            builder: (controller) =>
              Center(
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
                              child: Image
                                  .network(
                                "https://static.thenounproject.com/png/3322766-200.png",
                                height: 100.0,
                                width: 100.0,
                              ),
                            ),
                          ),
                        ),
                      )
                    : SingleChildScrollView(
                        scrollDirection:
                            Axis.vertical,
                        child: Wrap(
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
              ),
            
          )),
    ],
      ) ;
  }
}
