import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pretty_http_logger/pretty_http_logger.dart';

class HttpHelper {
  static const _baseUrl = "https://medicine2mg.com";

  static Future<Map<String, dynamic>> post(
      String endpoint, dynamic data) async {
    HttpWithMiddleware http = HttpWithMiddleware.build(middlewares: [
      HttpLogger(logLevel: LogLevel.BODY),
    ]);

    final response = await http.post(Uri.parse('$_baseUrl/$endpoint'),
        headers: {'Content-Type': 'application/json'}, body: json.encode(data));

    return handleResponse(response);
  }


  static Future<Map<String,dynamic>> get(String endpoint) async{

    HttpWithMiddleware http = HttpWithMiddleware.build(middlewares: [
      HttpLogger(logLevel: LogLevel.BODY),
    ]);
    final response= await http.get(Uri.parse('$_baseUrl/$endpoint'));

    return handleResponse(response);
  }


  static dynamic handleResponse(http.Response response) {
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else if (response.statusCode == 400) {
      print("400 error${json.decode(response.body)}");
      return json.decode(response.body);
    } else if (response.statusCode == 401) {
      print("401 error${json.decode(response.body)}");
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }
}
