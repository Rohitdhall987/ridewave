class TripsByState {
  TripsByState({
    required this.status,
    required this.message,
    required this.data,
  });
  late final String status;
  late final String message;
  late final List<Data> data;

  TripsByState.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.stateName,
    required this.title,
    required this.image,
    required this.price,
    required this.description,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String stateName;
  late final String title;
  late final String image;
  late final String price;
  late final String description;
  late final int status;
  late final String createdAt;
  late final String updatedAt;

  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    stateName = json['state_name'];
    title = json['title'];
    image = json['image'];
    price = json['price'];
    description = json['description'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['state_name'] = stateName;
    _data['title'] = title;
    _data['image'] = image;
    _data['price'] = price;
    _data['description'] = description;
    _data['status'] = status;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}