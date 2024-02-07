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

//5) Array of JSON to List of Class/Object transformer
// If you are working with an array you need step 5
// If you are working with an object .. no need step 5

  static List<MovieSearch> moviesFromJson(dynamic json ){
    var searchResult = json["Search"]; // Refer to the "Search" in the json
    List<MovieSearch> results = List.empty(growable: true); // Create an empty growable List

    if (searchResult != null){

      searchResult.forEach((v)=>{ // Go through the Array in Json
        results.add(MovieSearch.fromJson(v)) // Add it to the list
      });
      return results;
    }
    return results;
  }


}