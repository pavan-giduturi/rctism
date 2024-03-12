import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

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
  String? districtDropDownValue;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    log(argumentData.toString());
  }
}
