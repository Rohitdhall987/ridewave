class LoginData {
  LoginData({
    required this.id,
    required this.uid,
    required this.name,
    required this.email,
    required this.token,
  });
  late final int id;
  late final String uid;
  late final String name;
  late final String email;
  late final String token;

  LoginData.fromJson(Map<String, dynamic> json){
    id = json['id'];
    uid = json['uid'];
    name = json['name'];
    email = json['email'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['uid'] = uid;
    _data['name'] = name;
    _data['email'] = email;
    _data['token'] = token;
    return _data;
  }
}