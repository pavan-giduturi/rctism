import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../apiservice/restapi.dart';

class ProfileslistController extends GetxController{

  List profileslistData = [];
  List serviceRequestslistData = [];
  Map profileData = {};

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllProfilesData();
    getProfileData();
  }

  getAllProfilesData() async {
    SharedPreferences userPref = await SharedPreferences.getInstance();
    var userID = userPref.getString('userID').toString();
    // var userID = "638";
    var empCode = userPref.getString('empCode').toString();
    // var empCode = "RCTP0040";
    var empMainRoleType = userPref.getString('empRoleType').toString();
    var empRoleType = userPref.getString('empRoleType').toString();
    var empID = userPref.getString('empID').toString();

    if(empID == "" || empID == null){
      empID="1";
    }

    print("--=-=-===-");
    print(userID.toString());
    print(empMainRoleType.toString());
    print(empCode.toString());
    print(empID.toString());
    profileslistData = [];
    serviceRequestslistData = [];

    if(empMainRoleType == "pof"){
      empRoleType = "po";
      empID="1";
      await ApiService.getProfilesListData("pm_users",userID,empCode,empRoleType,empID).then((success) {
        var responseBody = json.decode(success);
        // log(responseBody.toString());
        if (responseBody['status'].toString() == 'true') {
          print("----------profileslistData");
          profileslistData = responseBody['data'];
          print(profileslistData);
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
    } else if(empMainRoleType == "pm"){
      await ApiService.getProfilesListData("social_workers",userID,empCode,empRoleType,empID).then((success) {
        var responseBody = json.decode(success);
        // log(responseBody.toString());
        if (responseBody['status'].toString() == 'true') {
          print("----------profileslistData");
          profileslistData = responseBody['data'];
          print(profileslistData);
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
    } else if(empMainRoleType == "sw"){
      await ApiService.getProfilesListData("service_request",userID,empCode,empRoleType,empID).then((success) {
        var responseBody = json.decode(success);
        // log(responseBody.toString());
        if (responseBody['status'].toString() == 'true') {
          print("----------profileslistData");
          serviceRequestslistData = responseBody['data'];
          print(serviceRequestslistData);
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
      }
      update();
    });
  }

}