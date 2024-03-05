import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ServiceRequestForm1Controller extends GetxController {
  final formKey = GlobalKey<FormState>();
  dynamic argumentData = Get.arguments;
  final TextEditingController recipientController = TextEditingController();
  final TextEditingController surNameController = TextEditingController();
  final TextEditingController sonOfController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController mobNumController = TextEditingController();
  final TextEditingController altMobNumController = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    log(argumentData.toString());
  }
}
