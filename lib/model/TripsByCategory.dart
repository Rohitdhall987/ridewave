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

class Trips {
  Trips({
    required this.id,
    required this.categoryId,
    required this.title,
    required this.image,
    required this.description,
    required this.date,
    required this.time,
    required this.price,
    required this.fromState,
    required this.toState,
    required this.seats,
    required this.companyId,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final int categoryId;
  late final String title;
  late final String image;
  late final String description;
  late final String date;
  late final String time;
  late final String price;
  late final String fromState;
  late final String toState;
  late final String seats;
  late final String companyId;
  late final int status;
  late final String createdAt;
  late final String updatedAt;

  Trips.fromJson(Map<String, dynamic> json){
    id = json['id'];
    categoryId = json['category_id'];
    title = json['title'];
    image = json['image'];
    description = json['description'];
    date = json['date'];
    time = json['time'];
    price = json['price'];
    fromState = json['from_state'];
    toState = json['to_state'];
    seats = json['seats'];
    companyId = json['company_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['category_id'] = categoryId;
    _data['title'] = title;
    _data['image'] = image;
    _data['description'] = description;
    _data['date'] = date;
    _data['time'] = time;
    _data['price'] = price;
    _data['from_state'] = fromState;
    _data['to_state'] = toState;
    _data['seats'] = seats;
    _data['company_id'] = companyId;
    _data['status'] = status;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}