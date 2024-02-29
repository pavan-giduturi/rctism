import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class IdentityCaptureController extends GetxController {
  List names = [], paths = [], baseImg = [];
  final ImagePicker _picker = ImagePicker();
  File? image, selectedImage;

  imageDialog() {
    Get.defaultDialog(
      title: "Capture Identity",
      content: Center(
        child: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(color: Colors.white),
          height: 180,
          width: 300,
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              GestureDetector(
                  child: const Card(
                    color: Colors.red,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Take Photo",
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  onTap: () async {
                    takePhoto(
                      ImageSource.camera,
                    );
                    Get.back();
                  }),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                child: const Card(
                  color: Colors.red,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Choose From Gallery",
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                onTap: () {
                  takePhoto(
                    ImageSource.gallery,
                  );
                  Get.back();
                },
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                child: const Card(
                  color: Colors.red,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Cancel",
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                onTap: () {
                  Get.back();
                },
              )
            ],
          ),
        ),
      ),
    );
    update();
  }

  takePhoto(
    ImageSource source,
  ) async {
    names = [];
    paths = [];
    baseImg = [];

    final XFile? image = await _picker.pickImage(
      source: source,
      imageQuality: 20,
    );

    final File file = File(image!.path);

    try {
      selectedImage = file;
      String fileName = image.path.toString().split('/').last;
      List<int> imageBytes = selectedImage!.readAsBytesSync();
      var imageB64 = base64Encode(imageBytes);
      baseImg.add(imageB64);
      names.add(fileName);
      paths.add(image.path.toString());
      log(baseImg.toString());
      log(names.toString());
      log(paths.toString());
    } catch (e) {
      log("Error Occurred ${e.toString()}");
    }
    update();
  }
}
