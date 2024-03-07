import 'package:get/get.dart';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rctism/helpers/utilities.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../apiservice/restapi.dart';

class AadhaarCaptureController extends GetxController {
  List names = [], paths = [], baseImg = [];
  final ImagePicker _picker = ImagePicker();
  File? frontImage, frontSelectedImage;
  List backNames = [], backPaths = [], backBaseImg = [];
  File? backImage, backSelectedImage;
  List serviceRequestResponse = [];

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

  submitServiceRequestForm() async {
    SharedPreferences userPref = await SharedPreferences.getInstance();
    var empCode = userPref.getString('empCode').toString();
    var empID = userPref.getString('empID').toString();
    var userID = userPref.getString('userID').toString();
    var roleType = userPref.getString('empRoleType').toString();
    var form1Data = jsonDecode(Utilities.form1List);
    var form2Data = jsonDecode(Utilities.form2List);
    var identityCaptureData = jsonDecode(Utilities.identityCaptureList);
    var aadhaarCaptureData = jsonDecode(Utilities.aadhaarCaptureList);
    var reqType = form1Data['requestType'].toString();
    var recipientName = form1Data['recipientName'].toString();
    var recipientSurName = form1Data['recipientSurname'].toString();
    var recipientGender = form1Data['recipientGender'].toString();
    var recipientSonOf = form1Data['recipientSonOf'].toString();
    var guardianName = form1Data['recipientName'].toString();
    var mobNumber = form1Data['recipientMobNumber'].toString();
    var altMobNum = form1Data['recipientAltMobNumber'].toString();
    var recipientDOB = form1Data['recipientDOB'].toString();
    var aadhaarNum = form2Data['aadhaarNumber'].toString();
    var doorNum = form2Data['doorNum'].toString();
    var streetName = form2Data['streetName'].toString();
    var villageName = form2Data['villageName'].toString();
    var mandalName = form2Data['mandalName'].toString();
    var stateID = form2Data['stateID'].toString();
    var districtID = form2Data['districtID'].toString();
    var pinCode = form2Data['districtID'].toString();
    var actionType = 'new';
    var cultivationType = form2Data['cultivationType'].toString();
    var acresID = form2Data['landExtent'].toString();
    var centsID = form2Data['landCents'].toString();
    var voterID = form2Data['voterID'].toString();
    var addedBy = userID.toString();
    var photoPath = identityCaptureData['filePath'].toString();
    var fullphotoPath = identityCaptureData['filePath'].toString();
    log('-----------------------');
    log(empCode.toString());
    log(empID.toString());
    log(userID.toString());
    log(roleType.toString());
    log('-----------------------');
    log('-----------------------');
    log(form1Data.toString());
    log(form2Data.toString());
    log(identityCaptureData.toString());
    log(aadhaarCaptureData.toString());
    log('-----------------------');
    await ApiService.submitServiceRequest(
      "service_request/add",
      empCode,
      userID,
      roleType,
      empID,
      reqType,
      recipientName,
      recipientSurName,
      recipientGender,
      recipientSonOf,
      guardianName,
      mobNumber,
      altMobNum,
      recipientDOB,
      aadhaarNum,
      doorNum,
      streetName,
      villageName,
      mandalName,
      stateID,
      districtID,
      pinCode,
      actionType,
      cultivationType,
      acresID,
      centsID,
      voterID,
      addedBy,
      photoPath,
      fullphotoPath,
    ).then((success) {
      var responseBody = json.decode(success);
      log(responseBody.toString());
      // if (responseBody['status'].toString() == 'true') {
      //   // serviceRequestResponse = responseBody['profile'];
      //   // log(profileData.toString());
      // } else {
      //   Get.snackbar('Alert', 'Error Occured',
      //       messageText: const Text(
      //         'Error Occured',
      //         style:
      //             TextStyle(fontWeight: FontWeight.w400, color: Colors.white),
      //       ),
      //       titleText: const Text('Alert',
      //           style: TextStyle(
      //               fontWeight: FontWeight.bold, color: Colors.white)),
      //       backgroundColor: Colors.deepPurple,
      //       barBlur: 20,
      //       overlayBlur: 5,
      //       colorText: Colors.black,
      //       animationDuration: const Duration(seconds: 3));
      //   log('error');
      // }
      update();
    });
  }
}
