import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/services/api_exption.dart';
import 'package:http/http.dart' as http;

import 'base_service.dart';

enum APIType { aPost, aGet }

class ApiService extends BaseService {
  var response;
  final String baseURL =
      'https://b84601c0-8adb-44ee-8983-dd400c75c602.mock.pstmn.io/api/';

  Future<dynamic> getResponse(
      {@required APIType apiType,
      @required String url,
      Map<String, dynamic> body,
      bool fileUpload = false}) async {
    // Map<String, String> header = {
    //   "Content-Type": "$contentTypeToken",
    // };
    Map<String, String> header = {
      'Access-Control-Allow-Credentials': 'true',
      'Access-Control-Allow-Origin': 'http://localhost:8080',
      'Access-Control-Allow-Methods': 'GET',
      'Access-Control-Request-Headers': 'X-Custom-Header'
    };

    try {
      log("URL ---> ${Uri.parse(baseURL + url)}");
      if (apiType == APIType.aGet) {
        var result = await http.get(
          Uri.parse(baseURL + url),
        );
        response = returnResponse(
          result.statusCode,
          result.body,
        );
        log("response...get-api...$response");
      } else if (fileUpload) {
        dio.FormData formData = new dio.FormData.fromMap(body);

        dio.Response result = await dio.Dio().post(baseURL + url,
            data: formData,
            options: dio.Options(
              contentType: "form-data",
            ));

        response = returnResponse(result.statusCode, jsonEncode(result.data));
        log("response...dio-api...$response");
      } else {
        String encodeBody = jsonEncode(body);
        var result = await http.post(Uri.parse(baseURL + url),
            body: body, headers: header);
        response = returnResponse(result.statusCode, result.body);
        log("response...post-api...$response");
      }
      return response;
    } catch (e) {
      log('Error=>.. $e');
    }
  }

  returnResponse(int status, String result) {
    switch (status) {
      case 200:
        return jsonDecode(result);
      case 400:
        throw BadRequestException('Bad Request');
      case 401:
        throw UnauthorisedException('Unauthorised user');
      case 404:
        throw ServerException('Server Error');
      case 500:
      default:
        throw FetchDataException('Internal Server Error');
    }
  }
}
