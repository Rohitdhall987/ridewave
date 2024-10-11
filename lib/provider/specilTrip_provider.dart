import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ridewave/model/SpecialTrips.dart';
import 'package:ridewave/services/HomeServices.dart';  // HTTP requests




final specialTripsProvider = FutureProvider<SpecialTrips>((ref) async {

  return SpecialTrips.fromJson(await HomeService.getSpecialTrips());

});
