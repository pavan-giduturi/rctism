import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SocialworkerForm1Controller extends GetxController {
  final formKey = GlobalKey<FormState>();
  dynamic argumentData = Get.arguments;
  final TextEditingController recipientController = TextEditingController();
  final TextEditingController surNameController = TextEditingController();
  final TextEditingController sonOfController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobNumController = TextEditingController();
  final TextEditingController altMobNumController = TextEditingController();
  final TextEditingController aadhaarNumController = TextEditingController();
  final TextEditingController cultivationTypeController =
  TextEditingController();
  final TextEditingController doorNumController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController villageController = TextEditingController();
  final TextEditingController mandalNameController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController districtController = TextEditingController();
  final TextEditingController pinCodeController = TextEditingController();
  final TextEditingController voterIdController = TextEditingController();
  final TextEditingController qualificationController = TextEditingController();

  List landExtentList = [
    {'id': '1', 'name': 'Acres'}
  ];

  List statesList = [
    {'id': '1', 'name': 'Andhra Pradesh'},
    {'id': '2', 'name': 'Telangana'},
  ];
  String? stateDropDownValue;
  String? extentDropDownValue;
  List centsList = [
    {'id': '1', 'name': 'Cents'}
  ];

  String? centsDropDownValue;

  List districtList = [
    {'id': '1', 'name': 'Visakhapatnam'},
    {'id': '2', 'name': 'Vijayanagar'},
  ];
  List genderTypes = [
    {"id": "Male", "name": "Male"},
    {"id": "Female", "name": "Female"},
    {"id": "Other", "name": "Other"},
  ];
  String? districtDropDownValue;
  String? genderDropDownValue;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    log(argumentData.toString());
  }

  datePicker(context) async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(), //get today's date
        firstDate: DateTime(
            2000), //DateTime.now() - not to allow to choose before today.
        lastDate: DateTime(2101));
    if (pickedDate != null) {
      log(pickedDate
          .toString()); //get the picked date in the format => 2022-07-04 00:00:00.000
      String formattedDate = DateFormat('yyyy-MM-dd').format(
          pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
      log(formattedDate
          .toString()); //formatted date output using intl package =>  2022-07-04
      //You can format date as per your need
      dobController.text =
          formattedDate; //set foratted date to TextField value.
    } else {
      log("Date is not selected");
    }
  }
}
