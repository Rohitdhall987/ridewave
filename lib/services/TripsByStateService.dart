import 'dart:convert';

import 'package:http/http.dart' as http;


import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:ridewave/model/TripsBySingleCategory.dart';
import 'package:ridewave/model/TripsByState.dart';

class TripService{
  static Future<Map<String, dynamic>> getTripsByStateJson(name) async {
    final response = await http.post(Uri.parse('${dotenv.env["BASEURL"]}/user/specialTripsByState?state_name=$name'));

    if (response.statusCode == 200) {

      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load user data');
    }

  }

  static Future<TripsByState> getTripsByState(name) async {
    final response = await http.post(Uri.parse('${dotenv.env["BASEURL"]}/user/specialTripsByState?state_name=$name'));

    if (response.statusCode == 200) {

      return TripsByState.fromJson( jsonDecode(response.body));
    } else {
      throw Exception('Failed to load user data');
    }

  }



  static Future<Map<String, dynamic>> getTripsByCategoryJson(id) async {
    final response = await http.post(Uri.parse('${dotenv.env["BASEURL"]}/user/allTripsByCategory?category_id=$id'));

    if (response.statusCode == 200) {

      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load user data');
    }

  }

  static Future<TripsBySingleCategory> getTripsByCategory(id) async {
    final response = await http.post(Uri.parse('${dotenv.env["BASEURL"]}/user/allTripsByCategory?category_id=$id'));

    if (response.statusCode == 200) {

      return TripsBySingleCategory.fromJson( jsonDecode(response.body));
    } else {
      throw Exception('Failed to load user data');
    }

  }
}