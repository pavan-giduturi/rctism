import 'package:get/get.dart';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rctism/helpers/utilities.dart';
import 'package:rctism/views/home/homescreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../apiservice/restapi.dart';

class ChangePasswordController extends GetxController {

  final formKey = GlobalKey<FormState>();
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();



  submitChangePasswordForm() async {
    SharedPreferences userPref = await SharedPreferences.getInstance();
    var empCode = userPref.getString('empCode').toString();
    var oldPwd = oldPasswordController.text.toString();
    var newPwd = newPasswordController.text.toString();
    var newConfirmPwd = confirmPasswordController.text.toString();

    print("password");
    print(oldPwd.toString());
    print(newPwd.toString());
    print(newConfirmPwd.toString());


    await ApiService.submitChangePassword(
        "cpassword",
        empCode,
        oldPwd,
        newPwd,
        newConfirmPwd,
    ).then((success) {
      var responseBody = json.decode(success);
      log(responseBody.toString());
      if (responseBody['status'].toString() == 'true') {
        Get.snackbar('Success', 'Password Changed Successfully',
            messageText: const Text(
              'Password Changed Successfully',
              style:
              TextStyle(fontWeight: FontWeight.w400, color: Colors.white),
            ),
            titleText: const Text('Success',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white)),
            backgroundColor: Colors.deepPurple,
            barBlur: 20,
            overlayBlur: 5,
            colorText: Colors.black,
            animationDuration: const Duration(seconds: 3));
        Get.offAll(()=>const HomeScreen());
      } else {
        Get.snackbar('Alert', "Sorry...",
            messageText:  Text(
              responseBody['message'].toString(),
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
