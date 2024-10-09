class Version {
  Version({
    required this.version,
    required this.skip,
    required this.testing,
  });
  late final String version;
  late final bool skip;
  late final bool testing;

  Version.fromJson(Map<String, dynamic> json){
    version = json['version'];
    skip = json['skip'];
    testing = json['testing'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['version'] = version;
    _data['skip'] = skip;
    _data['testing'] = testing;
    return _data;
  }
}