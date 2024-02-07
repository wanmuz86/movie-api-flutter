// 1) Create the class
import 'package:movie_app/models/rating.dart';

class MovieDetail {
  // 2 ) Define the properties
  final String imdbId;
  final String title;
  final String poster;
  final String type;
  final String rated;
  final String? released;
  final String runtime;
  final String year;
  final String actors;
  final String director;
  final String plot;
  final List<Rating> ratings;

  // 3) Create the constructor

MovieDetail({required this.imdbId, required this.title, required this.poster,
required this.type, required this.rated,  this.released, required this.runtime, required this.year,
required this.actors, required this.director, required this.plot, required this.ratings});

// 4) Json to object method

factory MovieDetail.fromJson(dynamic json){
  return MovieDetail(imdbId: json["imdbID"],
      title: json["Title"],
      poster: json["Poster"],
      type: json["Type"], rated: json["Rated"], runtime: json["Runtime"],
      year: json["Year"], actors: json["Actors"], director: json["Director"],
      plot: json["Plot"], released: json["Released"] ?? "",
      ratings: Rating.ratingsFromJson(json["Ratings"]));
}
}