import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';

class NetworkUtil {
  static NetworkUtil _instance = new NetworkUtil.internal();
  NetworkUtil.internal();
  factory NetworkUtil() => _instance;

  String bearerToken;

  Future<dynamic> get(String url) async {
    await getToken();
    return http.get(url, headers: {
      HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
      HttpHeaders.authorizationHeader: 'Bearer $bearerToken',
      HttpHeaders.acceptHeader: 'application/json'
    }).then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || res == null) {
        throw new Exception('Error while fetching data');
      }

      if (res.isEmpty) return null;

      return json.decode(res);
    });
  }

  Future<dynamic> post(String url, {Map body, encoding}) async {
    await getToken();
    return http
        .post(url,
            body: body,
            headers: {
              HttpHeaders.contentTypeHeader:
                  'application/x-www-form-urlencoded',
              HttpHeaders.authorizationHeader: 'Bearer $bearerToken',
              HttpHeaders.acceptHeader: 'application/json'
            },
            encoding: encoding)
        .then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || res == null) {
        throw new Exception('Error while fetching data');
      }

      if (res.isEmpty) return null;

      return json.decode(res);
    });
  }

  getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bearerToken = prefs.getString('bearerToken');
  }
}
