import 'package:get/get.dart';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AadhaarCaptureController extends GetxController{

  List names = [], paths = [], baseImg = [];
  final ImagePicker _picker = ImagePicker();
  File? frontImage, frontSelectedImage;
  List backNames = [], backPaths = [], backBaseImg = [];
  File? backImage, backSelectedImage;

  frontImageDialog() {
    Get.defaultDialog(
      title: "Aadhaar Identity",
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
                    frontTakePhoto(
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
                  frontTakePhoto(
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

  backImageDialog() {
    Get.defaultDialog(
      title: "Aadhaar Identity",
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
                    backTakePhoto(
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
                  backTakePhoto(
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

  frontTakePhoto(
      ImageSource source,
      ) async {
    names = [];
    paths = [];
    baseImg = [];

    final XFile? image = await _picker.pickImage(
      source: source,
      imageQuality: 50,
    );

    final File file = File(image!.path);

    try {
      frontSelectedImage = file;
      String fileName = image.path.toString().split('/').last;
      List<int> imageBytes = frontSelectedImage!.readAsBytesSync();
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


  backTakePhoto(
      ImageSource source,
      ) async {
    backNames = [];
    backPaths = [];
    backBaseImg = [];

    final XFile? image = await _picker.pickImage(
      source: source,
      imageQuality: 50,
    );

    final File file = File(image!.path);

    try {
      backSelectedImage = file;
      String fileName = image.path.toString().split('/').last;
      List<int> imageBytes = frontSelectedImage!.readAsBytesSync();
      var imageB64 = base64Encode(imageBytes);
      backBaseImg.add(imageB64);
      backNames.add(fileName);
      backPaths.add(image.path.toString());
      log(backBaseImg.toString());
      log(backNames.toString());
      log(backPaths.toString());
    } catch (e) {
      log("Error Occurred ${e.toString()}");
    }
    update();
  }
}
