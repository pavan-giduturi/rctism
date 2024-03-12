import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ServiceRequestForm1Controller extends GetxController {
  final formKey = GlobalKey<FormState>();
  dynamic argumentData = Get.arguments;
  String? serviceTypeDropDownValue;
  final TextEditingController recipientController = TextEditingController();
  final TextEditingController surNameController = TextEditingController();
  final TextEditingController sonOfController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController mobNumController = TextEditingController();
  final TextEditingController altMobNumController = TextEditingController();
  List serviceReqTypes = [
    {"id": "1", "name": "GROCERY DISTRIBUTION PROGRAMME"},
    {"id": "2", "name": "CLOTHS DISTRIBUTION PROGRAM"},
    {"id": "3", "name": "EDUCATION ASSISTANCE"},
    {"id": "4", "name": "PROFESSIONAL MATERIAL ASSISTANCE"},
    {"id": "5", "name": "MEDICAL CAMP"},
    {"id": "6", "name": "PLANT DISTRIBUTION"},
    {"id": "7", "name": "HELP TO DISABLE PEOPLE"},
    {"id": "8", "name": "SKILL DEVELOPMENT PROGRAMME"},
    {"id": "9", "name": "SWACCHA BARATH WORK"},
    {"id": "10", "name": "CHILD BIRTH PROGRAMME"},
    {"id": "11", "name": "GIRL MARRIAGE PROGRAMME"},
    {"id": "12", "name": "FINANCIAL ASSISTANCE FOR FARMING"},
    {"id": "13", "name": "FAMILY COUNSELING"},
    {"id": "14", "name": "MOTIVATIONAL CLASSES FOR STUDENTS / EMPLOYEES"},
    {"id": "15", "name": "ANTHIMAYATHRA"},
    {"id": "16", "name": "YATRIKA NIVAS OR SADAN"},
    {"id": "17", "name": "GOSHALA"},
    {"id": "18", "name": "FREE AYURVEDIC MEDICINE"},
    {"id": "19", "name": "FREE YOGA CLASSES FOR BODY FITNESS"},
    {"id": "20", "name": "HIV AWARNESS"},
    {"id": "21", "name": "HEPING CANCER PATIENTS"},
    {"id": "22", "name": "CHILDREN HOME"},
    {"id": "23", "name": "OLD AGE HOMES"},
  ];

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
