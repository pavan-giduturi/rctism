import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../apiservice/restapi.dart';

class VerificationController extends GetxController {
  IconData verificationIcon = Icons.phone_android;
  dynamic argumentData = Get.arguments;
  List verificationList = [
    {
      "id": "1",
      "status":"1",
      "title": "Mobile Verification",
      "image": "https://rctism.com/assets/images/dashboard/progressing.png",
      "desc": "Mobile Verification Description"
    },
    {
      "id": "2",
      "status":"1",
      "title": "Aadhaar Verification",
      "image": "https://rctism.com/assets/images/dashboard/progressing.png",
      "desc": "Aadhaar Verification Description"
    },
    {
      "id": "3",
      "status":"0",
      "title": "Voter ID Verification",
      "image": "https://rctism.com/assets/images/dashboard/progressing.png",
      "desc": "Voter ID Verification Description"
    },
    {
      "id": "4",
      "status":"0",
      "title": "Former Verification",
      "image": "https://rctism.com/assets/images/dashboard/progressing.png",
      "desc": "Former Verification Description"
    },
    {
      "id": "5",
      "status":"0",
      "title": "Office Visit Verification",
      "image": "https://rctism.com/assets/images/dashboard/progressing.png",
      "desc": "Office Visit Verification Description"
    },
  ];

  @override
  void onInit() {
    super.onInit();
    getServiceReqVerificationData();
  }

  setIcon(id){
    if(id == "step1"){
      verificationIcon =  Icons.document_scanner_outlined;
    }else if(id == "step2"){
      verificationIcon =  Icons.filter_alt ;
    }else if(id == "step3"){
      verificationIcon =  Icons.design_services_outlined ;
    }else if(id == "step4"){
      verificationIcon =  Icons.document_scanner_outlined ;
    }else if(id == "step5"){
      verificationIcon =  Icons.food_bank_outlined ;
    }else{
      verificationIcon =  Icons.vertical_split_sharp ;
    }
  }

  getServiceReqVerificationData() async {
    SharedPreferences userPref = await SharedPreferences.getInstance();
    var empCode = userPref.getString('empCode').toString();
    var empID = userPref.getString('empID').toString();
    var userID = userPref.getString('userID').toString();
    var roleType = userPref.getString('empRoleType').toString();
    var reqId = argumentData.toString();

    await ApiService.getServiceReqVerificationData("service_request/${reqId}",empID, empCode, roleType, userID ).then((success) {
      var responseBody = json.decode(success);
      log(responseBody.toString());
      if (responseBody['status'].toString() == 'true') {
        verificationList = responseBody['data']['steps'];
        log(verificationList.toString());
      } else {
        Get.snackbar('Alert', 'Acess Denied',
            messageText:  Text(
              'Access Denied',
              style:
              TextStyle(fontWeight: FontWeight.w400, color: Colors.white),
            ),
            titleText: Text('Alert',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white)),
            backgroundColor: Colors.deepPurple,
            barBlur: 20,
            overlayBlur: 5,
            colorText: Colors.black,
            animationDuration: const Duration(seconds: 3));
        log('error');
      }
      update();
    });
  }
}
