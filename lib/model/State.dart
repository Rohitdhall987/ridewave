class State {
  State({
    required this.status,
    required this.message,
    required this.data,
  });
  late final String status;
  late final String message;
  late final List<Data> data;

  State.fromJson(Map<String, dynamic> json){
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
    required this.image,
    required this.state,
    required this.count,
  });
  late final String image;
  late final String state;
  late final int count;

  Data.fromJson(Map<String, dynamic> json){
    image = json['image'];
    state = json['state'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['image'] = image;
    _data['state'] = state;
    _data['count'] = count;
    return _data;
  }
}