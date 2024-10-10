import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ridewave/model/State.dart';
import 'package:ridewave/services/HomeServices.dart';  // HTTP requests




final stateDataProvider = FutureProvider<State>((ref) async {

  return State.fromJson(await HomeService.getStates());

});
