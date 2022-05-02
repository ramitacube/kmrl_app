import 'dart:collection';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kmrl_connect_to_business/network/shared_preference_helper.dart';

import 'network_exceptions.dart';

class ApiClient {
  late ErrorHandler? _errorHandler;
  late SharedPreferenceHelper _sharedPreferenceHelper;

  factory ApiClient({ErrorHandler? errorHandler}) {
    return ApiClient._internal(errorHandler);
  }

  ApiClient._internal(ErrorHandler? errorHandler) {
    _errorHandler = errorHandler;
    _sharedPreferenceHelper = SharedPreferenceHelper();
  }

  final JsonDecoder _decoder = JsonDecoder();

  Future<dynamic> get(String url) async {
    await _sharedPreferenceHelper.checkLogin();
    var header = {
      'Content-Type': 'application/json',
      "Authorization": 'Bearer ${_sharedPreferenceHelper.accessToken}'
    };
    return http
        .get(Uri.parse(url), headers: header)
        .then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null) {
        _errorHandler?.onError(
            message: "Error fetching data from server", code: statusCode);
        return null;
      }
      return _decoder.convert(res);
    });
  }

  Future<dynamic> post(String url,
      {Map<String, String>? headers,
      Map<String, dynamic>? body,
      encoding}) async {
    await _sharedPreferenceHelper.checkLogin();
    if (headers == null) {
      headers = HashMap<String, String>();
      headers['Content-Type'] = 'application/json';
      headers["Authorization"] =
          'Bearer ${_sharedPreferenceHelper.accessToken}';
      headers = {
        'Content-Type': 'application/json',
        "Authorization": 'Bearer ${_sharedPreferenceHelper.accessToken}'
      };
    }
    var bodyData = jsonEncode(body);
    print(bodyData);
    print(url);
    return http
        .post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(body),
    )
        .then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;
      if (statusCode < 200 || statusCode > 400 || json == null) {
        _errorHandler?.onError(
            message: "Error fetching data from server", code: statusCode);
        return null;
      }
      return _decoder.convert(res);
    });
  }

  Future<dynamic> put(String url,
      {Map<String, String>? headers, body, encoding}) async {
    if (headers == null) {
      headers = HashMap<String, String>();
      headers['Content-Type'] = 'application/json';
    }
    var bodyData = jsonEncode(body);
    print(jsonDecode(bodyData));
    return http
        .put(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(body),
    )
        .then((http.Response response) {
      final String res = response.body;

      final int statusCode = response.statusCode;
      if (statusCode < 200 || statusCode > 400 || json == null) {
        _errorHandler?.onError(
            message: "Error fetching data from server", code: statusCode);
        return null;
      }
      return _decoder.convert(res);
    });
  }
}
