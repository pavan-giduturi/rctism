import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../apiservice/restapi.dart';

class ProfileController extends GetxController{

  Map profileData = {};
  Map profileDataById = {};
  dynamic argumentData = Get.arguments;

  String userName = '';
  String empID = '';
  String serviceReqCount = '';
  String mobNum = '';
  String empDesignation = '';
  String empRole = '';
  String underTitle = '';



@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getProfileData();
    print("argumentData------------");
    print(argumentData);

    if(argumentData.toString().isNotEmpty){
      getProfileDataById();
    }
    setData();


  }

  getProfileData() async {
    SharedPreferences userPref = await SharedPreferences.getInstance();
    var empCode = userPref.getString('empCode').toString();
    log('-----------------------');
    await ApiService.getProfileData("profile",empCode ).then((success) {
      var responseBody = json.decode(success);
      log(responseBody.toString());
      if (responseBody['status'].toString() == 'true') {
        profileData = responseBody['profile'];
        log(profileData.toString());
      } else {
        Get.snackbar('Alert', 'Error Occured',
            messageText: const Text(
              'Error Occured',
              style:
              TextStyle(fontWeight: FontWeight.w400, color: Colors.white),
            ),
            titleText: const Text('Alert',
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

  getProfileDataById() async {
    SharedPreferences userPref = await SharedPreferences.getInstance();
    var empCode = argumentData.toString();
    log('-----------------------');
    await ApiService.getProfileData("profile",empCode ).then((success) {
      var responseBody = json.decode(success);
      log(responseBody.toString());
      if (responseBody['status'].toString() == 'true') {
        profileDataById = responseBody['profile'];
        log(profileDataById.toString());
      } else {
        Get.snackbar('Alert', 'Acess Denied',
            messageText: const Text(
              'Access Denied',
              style:
              TextStyle(fontWeight: FontWeight.w400, color: Colors.white),
            ),
            titleText: const Text('Alert',
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

  setData() async {
    SharedPreferences userPref = await SharedPreferences.getInstance();
    userName = "${userPref.getString('empName').toString().trim()} "
        " ${userPref.getString('empSurname').toString()}";
    empID = userPref.getString('empCode').toString();
    mobNum = userPref.getString('empMobNum').toString();
    empRole = userPref.getString('empRoleType').toString();
    if(empRole == "pof" || empRole == "po"){
      underTitle = "Under PDs";
      empDesignation = "PO (Project Officer)";
    }else if(empRole == "pm"){
      underTitle = "Under SWs";
      empDesignation = "PO (Project Director)";
    }else if(empRole == "sw"){
      underTitle = "Under Service Requests";
      empDesignation = "SW (Social Worker)";
    }else if(empRole == "srq" ){
      underTitle = "Under Service Requests";
      empDesignation = "SR (Service Request)";
    }
    update();
  }

}