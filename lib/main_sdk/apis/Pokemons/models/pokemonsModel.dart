class PokemonsModel {
  String? name;
  String? url;
  PokemonsModel({
    this.name,
    this.url,
  });

  PokemonsModel.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    url = json["url"];
  }
}
