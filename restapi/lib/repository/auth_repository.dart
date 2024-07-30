import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class AuthRepository {
  static Future<dynamic> addData(
      String url, String nama, String deskripsi) async {
    FormData formData =
        FormData.fromMap({"nama": nama, "deskripsi": deskripsi});

    Dio dio = Dio();

    if (kDebugMode) {
      print("DATA ENPOINT : $url");
    }

    final response = await dio.post(url, data: formData);
    if (kDebugMode) {
      print("DATA RESPONSE STATUS : ${response.statusCode}");
    }

    if (response.statusCode == 200) {
      if (kDebugMode) {
        print("DATA RESPONSE SERVER : ${response.data}");
      }
      return jsonDecode(response.data);
    } else {
      return jsonDecode(response.data);
    }
  }

  static Future<dynamic> getData(String url) async {
    Dio dio = Dio();

    if (kDebugMode) {
      print("DATA ENPOINT : $url");
    }

    final response = await dio.get(url);
    if (kDebugMode) {
      print("DATA RESPONSE STATUS : ${response.statusCode}");
    }

    if (response.statusCode == 200) {
      if (kDebugMode) {
        print("DATA RESPONSE SERVER : ${response.data}");
      }
      return jsonDecode(response.data);
    } else {
      return jsonDecode(response.data);
    }
  }

  static Future<dynamic> updateData(
      String url, int id, String nama, String deskripsi) async {
    FormData formData =
        FormData.fromMap({"id": id, "nama": nama, "deskripsi": deskripsi});

    Dio dio = Dio();

    if (kDebugMode) {
      print("DATA ENPOINT : $url");
    }

    final response = await dio.post(url, data: formData);
    if (kDebugMode) {
      print("DATA RESPONSE STATUS : ${response.statusCode}");
    }

    if (response.statusCode == 200) {
      if (kDebugMode) {
        print("DATA RESPONSE SERVER : ${response.data}");
      }
      return jsonDecode(response.data);
    } else {
      return jsonDecode(response.data);
    }
  }

  static Future<dynamic> updateHistory(String url, int id) async {
    FormData formData = FormData.fromMap({"id": id});

    Dio dio = Dio();

    if (kDebugMode) {
      print("DATA ENPOINT : $url");
    }

    final response = await dio.post(url, data: formData);
    if (kDebugMode) {
      print("DATA RESPONSE STATUS : ${response.statusCode}");
    }

    if (response.statusCode == 200) {
      if (kDebugMode) {
        print("DATA RESPONSE SERVER : ${response.data}");
      }
      return jsonDecode(response.data);
    } else {
      return jsonDecode(response.data);
    }
  }

  static Future<dynamic> deleteData(String url, int id) async {
    FormData formData = FormData.fromMap({"id": id});

    Dio dio = Dio();

    if (kDebugMode) {
      print("DATA ENPOINT : $url");
    }

    final response = await dio.post(url, data: formData);
    if (kDebugMode) {
      print("DATA RESPONSE STATUS : ${response.statusCode}");
    }

    if (response.statusCode == 200) {
      if (kDebugMode) {
        print("DATA RESPONSE SERVER : ${response.data}");
      }
      return jsonDecode(response.data);
    } else {
      return jsonDecode(response.data);
    }
  }
}
