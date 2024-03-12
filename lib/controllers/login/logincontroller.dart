import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rctism/helpers/utilities.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../apiservice/restapi.dart';
import '../../views/myaccount/myaccount.dart';
import '../../views/otpscreen/otpscreen.dart';

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
        Get.offAll(() => const MyAccount());
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

  getOTP(empMobNum) async {
    log(empMobNum.toString());
    log('-----------------------');
    await ApiService.getOTP("login", empMobNum).then((success) {
      var responseBody = json.decode(success);
      log(responseBody.toString());

      log(responseBody.toString());
      if (responseBody['status'].toString() == 'true') {
        Get.snackbar('Alert', 'OTP has been sent successfully',
            messageText: const Text(
              'OTP has been sent successfully',
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
        Get.to(() => const OtpScreen(),arguments: responseBody);
      } else {
        Get.snackbar('Alert', 'OTP sending failed',
            messageText: const Text(
              'OTP sending failed',
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
    userPref.setString("userID", response["data"]['user_id'].toString());
    userPref.setString("empID", response["data"]['emp_id'].toString());
    userPref.setString("empRole", response['data']['user_role'].toString());
    userPref.setString("empName", response["profile"]['name'].toString());
    userPref.setString("empSurname", response['profile']['surname'].toString());
    userPref.setString("empMobNum", response['profile']['mobile'].toString());
    userPref.setString("empRoleType", response['profile']['role'].toString());
    userPref.setBool("isLogin", true);
    log("==================");
    // log(response.toString());
    log(userPref.getString('empCode').toString());
    log(userPref.getString('empName').toString());
    log(userPref.getString('empSurname').toString());
    log(userPref.getString('empMobNum').toString());
    log(userPref.getString('empRoleType').toString());
    log(userPref.getString('userID').toString());
    log(userPref.getString('empID').toString());
    log(userPref.getBool('isLogin').toString());
    log("==================");
    if(response['data']['user_role'].toString() == "pof"){
      Utilities.isProjectOfficer =true;
    }else if(response['data']['user_role'].toString() == "pm"){
      Utilities.isPojectDirector = true;
    }else if(response['data']['user_role'].toString() == "pm"){
      Utilities.isPojectDirector = true;
    }else if(response['data']['user_role'].toString() == "sw"){
      Utilities.isSocialWorker = true;
    }else if(response['data']['user_role'].toString() == "srq"){
      Utilities.isServiceRequest = true;
    }
  }
}
