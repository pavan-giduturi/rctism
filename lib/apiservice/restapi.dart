import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;

class Url {
  static const String baseUrl = 'https://rctism.com/secureapi';
  static const String apiToken = 'bUBAc0ByQGRoaTEycFJB@2';
}

class ApiService {
  static Future get(
    url,
  ) async {
    try {
      final response =
          await http.get(Uri.parse('${Url.baseUrl}/$url'), headers: {
        'Authorization': 'b8416f2680eb194d61b33f9909f94b9d',
        'Content-Type': 'application/json'
      });
      log(HttpHeaders.requestHeaders.toString());
      log('${Url.baseUrl}/$url');
      log(response.statusCode.toString());
      return response;
    } catch (e) {
      return e;
    }
  }

  static Future post(url, body) async {
    try {
      final response = await http.post(Uri.parse('${Url.baseUrl}/$url'),
          headers: {
            "Content-Type": "multipart/form-data",
            "Authorization": "Bearer ${Url.apiToken}"
          },
          body: body);
      log('${Url.baseUrl}/$url');
      return response;
    } catch (e) {
      return e;
    }
  }

  static Future<String> empLogin(
    String url,
    String empCode,
    String empPassword,
  ) async {
    var postUri = Uri.parse('${Url.baseUrl}/$url');
    log(postUri.toString());
    log(Url.apiToken.toString());
    http.MultipartRequest request = http.MultipartRequest("POST", postUri);

    Map<String, String> headers = {
      "Content-Type": "multipart/form-data",
      "Authorization": "Bearer ${Url.apiToken}"
    };

    request.headers.addAll(headers);

    request.fields["inputEmpCode"] = empCode;
    request.fields["inputEmpPwd"] = empPassword;

    http.StreamedResponse response = await request.send();

    return response.stream.bytesToString();
  }

  static Future<String> submitChangePassword(
    String url,
    String empCode,
    String oldPwd,
    String newPwd,
    String newConfirmPwd,
  ) async {
    var postUri = Uri.parse('${Url.baseUrl}/$url');
    log(postUri.toString());
    log(Url.apiToken.toString());
    http.MultipartRequest request = http.MultipartRequest("POST", postUri);

    Map<String, String> headers = {
      "Content-Type": "multipart/form-data",
      "Authorization": "Bearer ${Url.apiToken}"
    };

    request.headers.addAll(headers);

    request.fields["emp_code"] = empCode;
    request.fields["old_pwd"] = oldPwd;
    request.fields["new_pwd"] = newPwd;
    request.fields["new_confirm_pwd"] = newConfirmPwd;

    http.StreamedResponse response = await request.send();

    return response.stream.bytesToString();
  }

  static Future<String> getOTP(
      String url,
      String empMobNumber,
      ) async {
    var postUri = Uri.parse('${Url.baseUrl}/$url');
    log(postUri.toString());
    log(Url.apiToken.toString());
    http.MultipartRequest request = http.MultipartRequest("POST", postUri);

    Map<String, String> headers = {
      "Content-Type": "multipart/form-data",
      "Authorization": "Bearer ${Url.apiToken}"
    };

    request.headers.addAll(headers);

    request.fields["inputEmpMobile"] = empMobNumber;

    http.StreamedResponse response = await request.send();

    return response.stream.bytesToString();
  }

  static Future<String> verifyOTP(
      String url,
      String empMobNumber,
      String empOTP,
      String empCode,
      ) async {
    var postUri = Uri.parse('${Url.baseUrl}/$url');
    log(postUri.toString());
    log(Url.apiToken.toString());
    http.MultipartRequest request = http.MultipartRequest("POST", postUri);

    Map<String, String> headers = {
      "Content-Type": "multipart/form-data",
      "Authorization": "Bearer ${Url.apiToken}"
    };

    request.headers.addAll(headers);

    request.fields["inputEmpMobile"] = empMobNumber;
    request.fields["inputEmpOTP"] = empOTP;
    request.fields["inputEmpCode"] = empCode;

    http.StreamedResponse response = await request.send();

    return response.stream.bytesToString();
  }

  static Future<String> getProfileData(
      String url,
      String empCode,
      ) async {
    var postUri = Uri.parse('${Url.baseUrl}/$url');
    log(postUri.toString());
    log(Url.apiToken.toString());
    http.MultipartRequest request = http.MultipartRequest("POST", postUri);

    Map<String, String> headers = {
      "Content-Type": "multipart/form-data",
      "Authorization": "Bearer ${Url.apiToken}"
    };

    request.headers.addAll(headers);

    request.fields["inputEmpCode"] = empCode;

    http.StreamedResponse response = await request.send();

    return response.stream.bytesToString();
  }

  static Future<String> getDashboardData(
      String url,
      String empID,
      String empCode,
      String roleType,
      String userID,
      ) async {
    var postUri = Uri.parse('${Url.baseUrl}/$url');
    log(postUri.toString());
    log(Url.apiToken.toString());
    http.MultipartRequest request = http.MultipartRequest("POST", postUri);

    Map<String, String> headers = {
      "Content-Type": "multipart/form-data",
      "Authorization": "Bearer ${Url.apiToken}"
    };

    request.headers.addAll(headers);

    request.fields["emp_id"] = empID;
    request.fields["inputEmpCode"] = empCode;
    request.fields["role_type"] = roleType;
    request.fields["user_id"] = userID;

    http.StreamedResponse response = await request.send();

    return response.stream.bytesToString();
  }

  static Future<String> getServiceReqVerificationData(
      String url,
      String empID,
      String empCode,
      String roleType,
      String userID,
      ) async {
    var postUri = Uri.parse('${Url.baseUrl}/$url');
    log(postUri.toString());
    log(Url.apiToken.toString());
    http.MultipartRequest request = http.MultipartRequest("POST", postUri);

    Map<String, String> headers = {
      "Content-Type": "multipart/form-data",
      "Authorization": "Bearer ${Url.apiToken}"
    };

    request.headers.addAll(headers);

    request.fields["emp_id"] = empID;
    request.fields["inputEmpCode"] = empCode;
    request.fields["role_type"] = roleType;
    request.fields["user_id"] = userID;

    http.StreamedResponse response = await request.send();

    return response.stream.bytesToString();
  }

  static Future<String> getProfilesListData(
      String url,
      String user_id,
      String empCode,
      String role_type,
      String empID,

      ) async {
    var postUri = Uri.parse('${Url.baseUrl}/$url');
    log(postUri.toString());
    log(Url.apiToken.toString());
    http.MultipartRequest request = http.MultipartRequest("POST", postUri);

    Map<String, String> headers = {
      "Content-Type": "multipart/form-data",
      "Authorization": "Bearer ${Url.apiToken}"
    };

    request.headers.addAll(headers);

    request.fields["user_id"] = user_id;
    request.fields["inputEmpCode"] = empCode;
    request.fields["role_type"] = role_type;

    if(role_type == "pm" || role_type == "sw"){
      request.fields["emp_id"] = empID;
    }

    http.StreamedResponse response = await request.send();

    return response.stream.bytesToString();
  }


  static Future<String> submitServiceRequest(
    String url,
    String empCode,
    String empUserId,
    String empRoleType,
    String empID,
    String requestType,
    String recipientName,
    String recipientSurName,
    String recipientGender,
    String recipientSonOf,
    String guardianName,
    String mobNumber,
    String altMobNum,
    String recipientDOB,
    String aadhaarNum,
    String doorNum,
    String streetName,
    String villageName,
    String mandalName,
    String stateID,
    String districtID,
    String pinCode,
    String actionType,
    String cultivationType,
    String acresID,
    String centsID,
    String voterID,
    String addedBy,
    String photoPath,
    String aadhaarFront,
    String aadhaarBack,
  ) async {
    var postUri = Uri.parse('${Url.baseUrl}/$url');
    log(postUri.toString());
    log(Url.apiToken.toString());
    http.MultipartRequest request = http.MultipartRequest("POST", postUri);

    Map<String, String> headers = {
      "Content-Type": "multipart/form-data",
      "Authorization": "Bearer ${Url.apiToken}"
    };

    request.headers.addAll(headers);

    request.fields["inputEmpCode"] = empCode;
    request.fields["user_id"] = empUserId;
    request.fields["role_type"] = empRoleType;
    request.fields["emp_id"] = empID;
    request.fields["req_type"] = requestType;
    // request.fields["req_type"] = "1";
    request.fields["recp_name"] = recipientName;
    request.fields["recp_surname"] = recipientSurName;
    request.fields["gender"] = recipientGender;
    request.fields["rel_ms"] = recipientSonOf;
    request.fields["gardian_name"] = guardianName;
    request.fields["phone_no"] = mobNumber;
    request.fields["alt_no"] = altMobNum;
    // request.fields["dob"] = "2023-06-29";
    request.fields["dob"] = recipientDOB;
    request.fields["aadhaar_no"] = aadhaarNum;
    request.fields["door_no"] = doorNum;
    request.fields["street"] = streetName;
    request.fields["village"] = villageName;
    request.fields["mandal"] = mandalName;
    request.fields["state_id"] = stateID;
    request.fields["district"] = districtID;
    request.fields["pincode"] = pinCode;
    request.fields["action_type"] = actionType;
    request.fields["cult_type"] = cultivationType;
    request.fields["acres"] = acresID;
    request.fields["cents"] = centsID;
    request.fields["voter_id"] = voterID;
    request.fields["added_by"] = addedBy;

    log("request.fields");
    log(request.fields.toString());

    request.files.add(await http.MultipartFile.fromPath('profile_img', photoPath));
    request.files.add(await http.MultipartFile.fromPath('cropped_profile_img', photoPath));
    request.files
        .add(await http.MultipartFile.fromPath('aadhar_back', aadhaarBack));
    request.files
        .add(await http.MultipartFile.fromPath('aadhar_front', aadhaarFront));

    log("request.files");
    log(request.files.toString());

    http.StreamedResponse response = await request.send();

    return response.stream.bytesToString();
  }

  static Future<String> submitSocialWorker(
      String url,
      String empCode,
      String empUserId,
      String empRoleType,
      String empID,
      String empPmId,
      // String requestType,
      String recipientName,
      String recipientSurName,
      String recipientDOJ,
      String email,
      String altMobNum,
      String mobNumber,
      String recipientGender,
      String recipientqualification,
      String aadhaarNum,
      String voter_id_no,
      String doorNum,
      String streetName,
      String villageName,
      String mandalName,
      String stateID,
      String districtID,
      String pinCode,
      String actionType,
      String addedBy,
      String photoPath,
      String aadhaarFront,
      String aadhaarBack
      ) async {
    var postUri = Uri.parse('${Url.baseUrl}/$url');
    log(postUri.toString());
    log(Url.apiToken.toString());
    http.MultipartRequest request = http.MultipartRequest("POST", postUri);

    Map<String, String> headers = {
      "Content-Type": "multipart/form-data",
      "Authorization": "Bearer ${Url.apiToken}"
    };

    request.headers.addAll(headers);

    request.fields["inputEmpCode"] = empCode;
    request.fields["pm_id"] = empPmId;
    request.fields["role_type"] = empRoleType;
    request.fields["name"] = recipientName;
    request.fields["surname"] = recipientSurName;
    request.fields["date_of_join"] = recipientDOJ;
    request.fields["email"] = email;
    request.fields["mobile"] = mobNumber;
    request.fields["alt_mobile"] = altMobNum;
    request.fields["gender"] = recipientGender;
    request.fields["qualification"] = recipientqualification;
     request.fields["aadhaar_no"] = aadhaarNum;
    request.fields["voter_id_no"] = voter_id_no;
    request.fields["door_no"] = doorNum;
    request.fields["street"] = streetName;
    request.fields["village"] = villageName;
    request.fields["mandal"] = mandalName;
    request.fields["state_id"] = stateID;
    request.fields["district"] = districtID;
    request.fields["pincode"] = pinCode;
    request.fields["action_type"] = actionType;
    request.fields["user_id"] = addedBy;
    request.fields["account_status"] = "0";

    log("request.social workers fields");
    log(request.fields.toString());

    request.files.add(await http.MultipartFile.fromPath('profile_img', photoPath));
    // request.files.add(await http.MultipartFile.fromPath('cropped_profile_img', photoPath));
    // request.files.add(await http.MultipartFile.fromPath('aadhar_back', aadhaarBack));
    request.files.add(await http.MultipartFile.fromPath('aadhar_front_img', aadhaarFront));

    log("request. social workers files");
    log(request.files.toString());

    http.StreamedResponse response = await request.send();

    return response.stream.bytesToString();
  }
}
