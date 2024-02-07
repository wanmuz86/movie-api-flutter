class Rating {
  final String source;
  final String value;

  Rating({required this.source, required this.value});

  factory Rating.fromJson(dynamic json){
    return Rating(source: json["Source"], value: json["Value"]);
  }
  static List<Rating> ratingsFromJson(dynamic json ){
    List<Rating> results = List.empty(growable: true);
    if (json != null){
      json.forEach((v)=>{
        results.add(Rating.fromJson(v))
      });
      return results;
    }
    return results;
  }

}