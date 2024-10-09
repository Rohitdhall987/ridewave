import 'package:http/http.dart' as http;

import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiServices{
  Future<Map<String, dynamic>> versionCheck() async {
    final response = await http.get(Uri.parse('${dotenv.env["BASEURL"]}/versionCheck'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load user data');
    }
  }
}