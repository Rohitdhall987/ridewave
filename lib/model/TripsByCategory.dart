import 'package:ridewave/model/Trip.dart';

class TripsByCategory {
  TripsByCategory({
    required this.status,
    required this.message,
    required this.allcategory,
  });
  late final String status;
  late final String message;
  late final List<Allcategory> allcategory;

  TripsByCategory.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    allcategory = List.from(json['allcategory']).map((e)=>Allcategory.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['allcategory'] = allcategory.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Allcategory {
  Allcategory({
    required this.id,
    required this.title,
    required this.serialNo,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.trips,
  });
  late final int id;
  late final String title;
  late final int serialNo;
  late final int status;
  late final String createdAt;
  late final String updatedAt;
  late final List<Trips> trips;

  Allcategory.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
    serialNo = json['serial_no'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    trips = List.from(json['trips']).map((e)=>Trips.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['serial_no'] = serialNo;
    _data['status'] = status;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['trips'] = trips.map((e)=>e.toJson()).toList();
    return _data;
  }
}

