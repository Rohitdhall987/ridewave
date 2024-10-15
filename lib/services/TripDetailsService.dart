import 'dart:convert';

import 'package:http/http.dart' as http;


import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:ridewave/model/Trip.dart';

class TripDetailsService{
  static Future<Map<String, dynamic>> getTripDetailsJson(id) async {
    final response = await http.post(Uri.parse('${dotenv.env["BASEURL"]}/user/singleTripDetails?trip_id=$id'));

    if (response.statusCode == 200) {

      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load user data');
    }

  }

  static Future<Trips> getTripDetails(id) async {
    final response = await http.post(Uri.parse('${dotenv.env["BASEURL"]}/user/singleTripDetails?trip_id=$id'));

    if (response.statusCode == 200) {

      return Trips.fromJson( jsonDecode(response.body)["trip"]);
    } else {
      throw Exception('Failed to load user data');
    }

  }
}