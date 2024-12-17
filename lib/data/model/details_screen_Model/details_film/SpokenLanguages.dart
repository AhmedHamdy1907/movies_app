class SpokenLanguages {
  SpokenLanguages({
      this.englishName, 
      this.iso6391, 
      this.name,});

  SpokenLanguages.fromJson(dynamic json) {
    englishName = json['english_name'];
    iso6391 = json['iso_639_1'];
    name = json['name'];
  }
  String? englishName;
  String? iso6391;
  String? name;


}