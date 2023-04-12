import 'dart:convert';

import 'package:dio/dio.dart';

class DioNetwork {
  static bool isTester = true;

  static String SERVER_DEVELOPMENT = "http://89.108.103.40";
  static String SERVER_PRODUCTION = "http://89.108.103.40";

  static Map<String, String> getHeaders() {
    String token = "eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2ODE4NTQzOTgsInVzZXJfaWQiOjN9.t0KC0iFwjCDnOUdYNVSJ2DR5_qWkiwLIUfmXHkWB4WmC6TKykFtC2maofn2msynosFiDRzRNfoc2OlQBxrU77A";
    Map<String, String> headers = {};
    headers.putIfAbsent("Authorization", () => "Bearer $token");
    return headers;
  }

  static String getServer() {
    if (isTester) return SERVER_DEVELOPMENT;
    return SERVER_PRODUCTION;
  }

  /* Http Requests */
  static Future<String?> GET(String api, Map<String, dynamic> params) async {
    var response =
        await Dio(BaseOptions(baseUrl: getServer(), headers: getHeaders()))
            .get(api, queryParameters: params);
    if (response.statusCode == 200) {
      return jsonEncode(response.data);
    }
    return null;
  }

  static Future<String?> POST(String api, Map<String, dynamic> params) async {
    var response = await Dio(BaseOptions(
        baseUrl: getServer(),
        headers: getHeaders(),
        validateStatus: (statusCode) {
          if (statusCode == null) {
            return false;
          }
          if (statusCode == 422) {
            return true;
          } else {
            return statusCode >= 200 && statusCode < 300;
          }
        })).post(api, data: params);
    if (response.statusCode == 200) {
      return jsonEncode(response.data);
    }
    return null;
  }

  static Future<String?> PUT(String api, Map<String, dynamic> params) async {
    var response =
        await Dio(BaseOptions(baseUrl: getServer(), headers: getHeaders()))
            .put(api, data: params);
    if (response.statusCode == 200) {
      return jsonEncode(response.data);
    }
    return null;
  }

  static Future<String?> PATCH(String api, Map<String, dynamic> params) async {
    var response =
        await Dio(BaseOptions(baseUrl: getServer(), headers: getHeaders()))
            .patch(api, data: params);
    if (response.statusCode == 200) {
      return jsonEncode(response.data);
    }
    return null;
  }

  static Future<String?> DELETE(String api, Map<String, dynamic> params) async {
    var response =
        await Dio(BaseOptions(baseUrl: getServer(), headers: getHeaders()))
            .delete(api, data: params);
    if (response.statusCode == 200) {
      return jsonEncode(response.data);
    }
    return null;
  }

  /* Http Apis */
  static String API_COMPLAINT_PROFILE = "/complaint/profile";

  /* Http Params */
  static Map<String, dynamic> paramsEmpty() {
    Map<String, String> params = {};
    return params;
  }

  static Map<String, dynamic> bodyComplaintProfile(int id, String category, String text) {
    Map<String, dynamic> params = {
      "to_user_id": id,
      "category": category,
      "text": text
    };
    return params;
  }
}
