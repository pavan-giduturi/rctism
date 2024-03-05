import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ServiceRequestForm2Controller extends GetxController {
  dynamic form1Data = Get.arguments;
  final formKey = GlobalKey<FormState>();
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

  List landExtentList = [
    {'id': '1', 'name': 'Acres'}
  ];

  String? extentDropDownValue;
  List centsList = [
    {'id': '1', 'name': 'Cents'}
  ];

  String? centsDropDownValue;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    log('arumnet data');
    log(form1Data.toString());
  }
}
