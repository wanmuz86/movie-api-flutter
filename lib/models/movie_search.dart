// 1) Define the class

class MovieSearch {
  //2 ) Define the properties (camelCase)
  final String title;
  final String year;
  final String imdbId;
  final String type;
  final String poster;

  //3) Create the constructor
MovieSearch({required this.title, required this.year, required this.imdbId,
  required this.type, required this.poster});

// 4) Create json to object/class transformer
// The right part needs to follow Json format
  // The left part follows our property
factory MovieSearch.fromJson(dynamic json){
  return MovieSearch(title: json["Title"], year: json["Year"],
      imdbId: json["imdbID"], type: json["Type"], poster: json["Poster"]);
}
}