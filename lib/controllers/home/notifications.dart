import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../apiservice/restapi.dart';

class NotificationsController extends GetxController{

  List notificationslistData = [];
  Map profileData = {};

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllNotificationsData();
  }

  getAllNotificationsData() async {
    SharedPreferences userPref = await SharedPreferences.getInstance();
    var userID = userPref.getString('userID').toString();
    // var userID = "638";
    var empCode = userPref.getString('empCode').toString();
    // var empCode = "RCTP0040";
    var empMainRoleType = userPref.getString('empRoleType').toString();
    var empRoleType = userPref.getString('empRoleType').toString();
    var empID = userPref.getString('empID').toString();

    print("--=-=-===-");
    print(userID.toString());
    print(empMainRoleType.toString());
    print(empCode.toString());
    print(empID.toString());
    notificationslistData = [];


    if(empMainRoleType == "notifications"){
      await ApiService.getProfilesListData("pm_users",userID,empCode,empRoleType,empID).then((success) {
        var responseBody = json.decode(success);
        // log(responseBody.toString());
        if (responseBody['status'].toString() == 'true') {
          print("----------profileslistData");
          notificationslistData = responseBody['data'];
          print(notificationslistData);
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


}