class GenresBrowser {
  GenresBrowser({
      this.id, 
      this.name,});

  GenresBrowser.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
  num? id;
  String? name;


}