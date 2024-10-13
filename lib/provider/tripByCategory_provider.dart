import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ridewave/model/TripsByCategory.dart';
import 'package:ridewave/services/HomeServices.dart';  // HTTP requests




final tripsByCategoryProvider = FutureProvider<TripsByCategory>((ref) async {

  return TripsByCategory.fromJson(await HomeService.getTripsByCategory());

});
