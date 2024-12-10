import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:weather_app/data/model/http_result/http_result.dart';
import 'package:weather_app/service/cache_service/cache_service.dart';

class ApiProvider {
  static Duration durationTimeout = const Duration(seconds: 30);

  Future<HttpResult> postRequest(url, body) async {
    final dynamic headers = header();
    if (kDebugMode) {
      log(url.toString());
      log(headers.toString());
      log(json.encode(body).toString());
    }
    try {
      http.Response response = await http
          .post(
        Uri.parse(url),
        headers: headers,
        body: json.encode(body),
      )
          .timeout(durationTimeout);


      return result(response);
    } on TimeoutException catch (_) {
      return HttpResult(
        isSuccess: false,
        status: -1,
        result: "Network",
      );
    } on SocketException catch (_) {
      return HttpResult(
        isSuccess: false,
        status: -1,
        result: "Network",
      );
    }
  }




  Future<HttpResult> getRequest(url, {bool isHeader = true}) async {
    final dynamic headers = header();
    if (kDebugMode) {
      log(url.toString());
      log(headers.toString());
    }
    try {
      http.Response response = await http
          .get(
        Uri.parse(url),
        headers: isHeader ? headers : null,
      )
          .timeout(durationTimeout);

      return result(response);
    } on TimeoutException catch (_) {
      return HttpResult(
        isSuccess: false,
        status: -1,
        result: "Network",
      );
    } on SocketException catch (_) {
      return HttpResult(
        isSuccess: false,
        status: -1,
        result: "Network",
      );
    }
  }

  ///http DELETE Request
  Future<HttpResult> delete(url) async {
    final dynamic headers = header();
    if (kDebugMode) {
      log(url.toString());
      log(headers.toString());
    }
    try {
      http.Response response = await http
          .delete(
        Uri.parse(url),
        headers: headers,
      )
          .timeout(durationTimeout);
      return result(response);
    } on TimeoutException catch (_) {
      return HttpResult(
        isSuccess: false,
        status: -1,
        result: "Network",
      );
    } on SocketException catch (_) {
      return HttpResult(
        isSuccess: false,
        status: -1,
        result: "Network",
      );
    }
  }

  Future<HttpResult> putRequest(url, body) async {
    final Map<String, String> headers = header();
    if (kDebugMode) {
      log(url.toString());
      log(headers.toString());
      log(json.encode(body).toString());
    }
    try {
      http.Response response = await http
          .put(
        Uri.parse(url),
        headers: headers,
        body: json.encode(body),
      )
          .timeout(durationTimeout);

      return result(response);
    } on TimeoutException catch (_) {
      return HttpResult(
        isSuccess: false,
        status: -1,
        result: "Internet error",
      );
    } on SocketException catch (_) {
      return HttpResult(
        isSuccess: false,
        status: -1,
        result: "Internet error",
      );
    }
  }

  HttpResult result(response) {
    if (kDebugMode) {
      log(response.body.toString());
      log(response.statusCode.toString());
    }
    int status = response.statusCode ?? 404;

    if (response.statusCode >= 200 && response.statusCode <= 299) {
      return HttpResult(
        isSuccess: true,
        status: status,
        result: json.decode(utf8.decode(response.bodyBytes)),
      );
    } else if (response.statusCode == 401 || response.statusCode == 403) {
      var result = json.decode(utf8.decode(response.bodyBytes));
      return HttpResult(
        isSuccess: false,
        status: status,
        result: result,
      );
    } else {
      try {
        var result = json.decode(utf8.decode(response.bodyBytes));
        return HttpResult(
          isSuccess: false,
          status: status,
          result: result,
        );
      } catch (_) {
        return HttpResult(
          isSuccess: false,
          status: status,
          result: "Server error",
        );
      }
    }
  }

  Map<String, String> header({
    bool isMultipart = false,
  }) {
    return {
      "Accept": "application/json",
      "lang": "en",
      'content-type': 'application/json; charset=utf-8',
    };
  }
}
