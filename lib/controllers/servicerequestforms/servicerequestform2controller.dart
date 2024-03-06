import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ServiceRequestForm2Controller extends GetxController {
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
  }
}
