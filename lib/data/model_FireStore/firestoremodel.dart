class FireStoreModel
{
  static const String CollectionName="watchList";
  static const String pathImageUrl = "https://image.tmdb.org/t/p/w500";
  late String? image;
  late String? title;
  late  String? date;
   late String? description;
   late bool?isdone;
   late num?id;
    FireStoreModel({required this.image,required this.date,required this.title,required this.description,required this.isdone,required this.id});
Map<String,dynamic>toJsonMovies()
{
return
    {
      "id":id,
      "isdone":isdone,
      "image":image,
      "title":title,
      "date":date,
      "description":description
    };
}

  FireStoreModel.readfirestore(Map<String,dynamic>json)
{
  id=json["id"];
  image=json["image"];
  title=json["title"];
  date=json["date"];
  description=json["description"];
  isdone=json["isdone"];
}

}