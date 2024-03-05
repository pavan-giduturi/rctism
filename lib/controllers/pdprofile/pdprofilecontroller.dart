import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../apiservice/restapi.dart';

class ProfileController extends GetxController{

  Map profileData = {};

@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getProfileData();
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

}