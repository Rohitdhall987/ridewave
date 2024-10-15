import 'dart:convert';

import 'package:http/http.dart' as http;


import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:ridewave/model/TripsByState.dart';

class TripByStateService{
  static Future<Map<String, dynamic>> getTripsJson(name) async {
    final response = await http.post(Uri.parse('${dotenv.env["BASEURL"]}/user/specialTripsByState?state_name=$name'));

    if (response.statusCode == 200) {

      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load user data');
    }

  }

  static Future<TripsByState> getTrips(name) async {
    final response = await http.post(Uri.parse('${dotenv.env["BASEURL"]}/user/specialTripsByState?state_name=$name'));

    if (response.statusCode == 200) {

      return TripsByState.fromJson( jsonDecode(response.body));
    } else {
      throw Exception('Failed to load user data');
    }

  }
}