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
      print(HttpHeaders.requestHeaders);
      print('${Url.baseUrl}/$url');
      print(response.statusCode);
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
}
