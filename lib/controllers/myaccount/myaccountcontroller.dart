import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyAccountController extends GetxController {
  String userName = '';
  String empID = '';
  String serviceReqCount = '';
  String mobNum = '';
  String empDesignation = '';
  String empRole = '';
  String underTitle = '';

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
    empRole = userPref.getString('empRoleType').toString();
    if(empRole == "pof" || empRole == "po"){
      underTitle = "Under PDs";
      empDesignation = "PO (Project Officer)";
    }else if(empRole == "pm"){
      underTitle = "Under SWs";
      empDesignation = "PO (Project Director)";
    }else if(empRole == "sw"){
      underTitle = "Under Service Requests";
      empDesignation = "SW (Social Worker)";
    }else if(empRole == "srq" ){
      underTitle = "Under Service Requests";
      empDesignation = "SR (Service Request)";
    }
    update();
  }
}
