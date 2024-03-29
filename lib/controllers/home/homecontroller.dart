import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:rctism/views/login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../apiservice/restapi.dart';
import '../../helpers/utilities.dart';
import '../../views/pdprofile/pdprofile.dart';

class HomeScreenController extends GetxController {
  final advancedDrawerController = AdvancedDrawerController();
  String userName = '', empID = '', serviceReqCount = '', mobNum = '';
  Map dashboardData = {};
  List serviceReqGrid = [
    {'id': '1', 'name': 'Grocery', 'image': 'assets/icons/groceryicon.png'},
    {'id': '2', 'name': 'Clothes', 'image': 'assets/icons/clothsicon.png'},
    {'id': '3', 'name': 'Education', 'image': 'assets/icons/educationicon.png'},
    {'id': '4', 'name': 'Medical', 'image': 'assets/icons/healthicon.png'},
    {'id': '5', 'name': 'Plant', 'image': 'assets/icons/planticon.png'},
    {
      'id': '6',
      'name': 'Skill Development',
      'image': 'assets/icons/skillicon.png'
    },
    {
      'id': '7',
      'name': 'Financial Assistance',
      'image': 'assets/icons/financeicon.png'
    },
    {
      'id': '8',
      'name': 'Family Counselling',
      'image': 'assets/icons/coupleicon.png'
    },
    {'id': '9', 'name': 'Motivational', 'image': 'assets/icons/skillicon.png'},
    {
      'id': '10',
      'name': 'Oldage Homes',
      'image': 'assets/icons/oldmanicon.png'
    },
  ];

  @override
  void onInit() {
    super.onInit();
    getDashboardData();
    setData();
  }


  setData() async {
    SharedPreferences userPref = await SharedPreferences.getInstance();
    userName = "${userPref.getString('empName').toString().trim()} "
        " ${userPref.getString('empSurname').toString()}";
    empID = userPref.getString('empCode').toString();
    mobNum = userPref.getString('empMobNum').toString();
    update();
  }

  getDashboardData() async {
    SharedPreferences userPref = await SharedPreferences.getInstance();
    var empCode = userPref.getString('empCode').toString();
    var empID = userPref.getString('empID').toString();
    var userID = userPref.getString('userID').toString();
    var roleType = userPref.getString('empRoleType').toString();

    await ApiService.getDashboardData("dashboard",empID, empCode, roleType, userID ).then((success) {
      var responseBody = json.decode(success);
      log(responseBody.toString());
      if (responseBody['status'].toString() == 'true') {
        dashboardData = responseBody['data'];
        log(dashboardData.toString());
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

  clearData() async {
    SharedPreferences userPref = await SharedPreferences.getInstance();
    userPref.clear();
    Utilities.isProjectOfficer =false;
    Utilities.isPojectDirector = false;
    Utilities.isSocialWorker = false;
    Utilities.isServiceRequest = false;
    Get.offAll(()=>const LoginScreen());
    update();
  }

}
