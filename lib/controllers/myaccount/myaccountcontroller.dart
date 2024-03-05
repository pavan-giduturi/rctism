import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyAccountController extends GetxController {
  String userName = '';
  String empID = '';
  String serviceReqCount = '';
  String mobNum = '';
  String empDesignation = '';

  @override
  void onInit() {
    super.onInit();
    setData();
  }

  setData() async {
    SharedPreferences userPref = await SharedPreferences.getInstance();
    userName = "${userPref.getString('empName').toString().trim()} "
        " ${userPref.getString('empSurname').toString()}";
    empID = userPref.getString('empCode').toString();
    mobNum = userPref.getString('empMobNum').toString();
    empDesignation = userPref.getString('empRole').toString();
    update();
  }
}
