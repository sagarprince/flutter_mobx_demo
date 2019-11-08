import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_mobx_demo/utilities/app_exception.dart';

class ApiBaseHelper {
  final String _baseUrl = "https://api.darksky.net/forecast/cfe0941867534a7e09555eebb5dd946c";

  Future<dynamic> get(http.Client client, String url) async {
    var parseResponse;
    try {
      final response = await client.get(_baseUrl + url);
      parseResponse = _parseResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return parseResponse;
  }

  dynamic _parseResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
