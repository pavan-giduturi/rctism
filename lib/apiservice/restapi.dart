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
    // request.fields["req_type"] = requestType;
    request.fields["req_type"] = "1";
    request.fields["recp_name"] = recipientName;
    request.fields["recp_surname"] = recipientSurName;
    request.fields["gender"] = recipientGender;
    request.fields["rel_ms"] = recipientSonOf;
    request.fields["gardian_name"] = guardianName;
    request.fields["phone_no"] = mobNumber;
    request.fields["alt_no"] = altMobNum;
    request.fields["dob"] = "2023-06-29";
    // request.fields["dob"] = recipientDOB;
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

    print("request.fields");
    print(request.fields);

    request.files.add(await http.MultipartFile.fromPath('profile_img', photoPath));
    request.files.add(await http.MultipartFile.fromPath('cropped_profile_img', photoPath));
    request.files
        .add(await http.MultipartFile.fromPath('aadhar_back', aadhaarBack));
    request.files
        .add(await http.MultipartFile.fromPath('aadhar_front', aadhaarFront));

    print("request.files");
    print(request.files);

    http.StreamedResponse response = await request.send();

    return response.stream.bytesToString();
  }
}
