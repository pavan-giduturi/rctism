import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../apiservice/restapi.dart';
import '../../views/home/homescreen.dart';

class LoginController extends GetxController {
  TextEditingController empID = TextEditingController();
  TextEditingController empPassword = TextEditingController();
  TextEditingController empMobile = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool checkValue = false;

  setCheckBox(value) {
    checkValue = value;
    update();
  }

  getLogin(empID, empPassword) async {
    log(empID.toString());
    log(empPassword.toString());
    log('-----------------------');
    await ApiService.empLogin("login", empID, empPassword).then((success) {
      var responseBody = json.decode(success);
      log(responseBody.toString());

      log(responseBody.toString());
      if (responseBody['status'].toString() == 'true') {
        saveUserDetails(responseBody);
        Get.snackbar('Alert', 'Logged In Successfully',
            messageText: const Text(
              'Logged In Successfully',
              style:
                  TextStyle(fontWeight: FontWeight.w400, color: Colors.white),
            ),
            titleText: const Text('Alert',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white)),
            backgroundColor: Colors.deepPurple,
            barBlur: 3,
            colorText: Colors.black,
            animationDuration: const Duration(seconds: 3));
        // Get.to(() => const OtpScreen());
        Get.offAll(() => const HomeScreen());
      } else {
        Get.snackbar('Alert', 'Login Failed Invalid data',
            messageText: const Text(
              'Login Failed Invalid data',
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

  saveUserDetails(response) async {
    SharedPreferences userPref = await SharedPreferences.getInstance();
    userPref.setString("empCode", response["data"]['emp_code'].toString());
    userPref.setString("empName", response["profile"]['name'].toString());
    userPref.setString("empSurname", response['profile']['surname'].toString());
    userPref.setString("empMobNum", response['profile']['mobile'].toString());
    // userPref.setBool("isLogin", true);
    log("==================");
    // log(response.toString());
    log(userPref.getString('empCode').toString());
    log(userPref.getString('empName').toString());
    log(userPref.getString('empSurname').toString());
    log(userPref.getString('empMobNum').toString());
    log("==================");
  }
}
