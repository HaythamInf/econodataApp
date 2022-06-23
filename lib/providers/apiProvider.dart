

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class ApiProvider{

  static Future<dynamic> get(String url) async{
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    return response.body;
  }

  static Future<dynamic> post(String url, Map<String, dynamic> body) async{
    final uri = Uri.parse(url);
    final response = await http.post(uri, body: body);
    return response.body;
  }

  static Future<dynamic> put(String url, Map<String, dynamic> body) async{
    final uri = Uri.parse(url);
    final response = await http.put(uri, body: body);
    return response.body;
  }

  static Future<dynamic> delete(String url) async{
    final uri = Uri.parse(url);
    final response = await http.delete(uri);
    return response.body;
  }

  static Future<dynamic> patch(String url, Map<String, dynamic> body) async{
    final uri = Uri.parse(url);
    final response = await http.patch(uri, body: body);
    return jsonDecode(response.body);
  } 

  static Future<String> getJson(String path) async {
    return await rootBundle.loadString(path);
  }
}