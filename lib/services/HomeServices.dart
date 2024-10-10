import 'dart:io';

import 'package:http/http.dart' as http;

import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:ridewave/model/LoginData.dart';
import 'package:ridewave/repositories/user_repositries.dart';

class HomeService{
  static Future<Map<String, dynamic>> getStates() async {
    final LoginData user= await UserRepository.getUserData();
    final response = await http.post(
        Uri.parse('${dotenv.env["BASEURL"]}/user/state?user_id=${user.id}'),
      headers: {
          HttpHeaders.authorizationHeader : "Bearer ${user.token}"
      }
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load user data');
    }
  }
}