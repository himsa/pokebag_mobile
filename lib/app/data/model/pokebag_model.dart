class PokeBagModel {
  String? name;
  String? url;
  String? username;

  PokeBagModel({this.name, this.url, this.username});

  PokeBagModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    data['username'] = username;
    return data;
  }
}
