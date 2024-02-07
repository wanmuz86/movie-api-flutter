import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_search.dart';
import 'package:http/http.dart' as http; // a function in http file

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _movies = [
  {
  "Title": "Harry Potter and the Deathly Hallows: Part 2",
  "Year": "2011",
  "imdbID": "tt1201607",
  "Type": "movie",
  "Poster": "https://m.media-amazon.com/images/M/MV5BMGVmMWNiMDktYjQ0Mi00MWIxLTk0N2UtN2ZlYTdkN2IzNDNlXkEyXkFqcGdeQXVyODE5NzE3OTE@._V1_SX300.jpg"
},
{
"Title": "Harry Potter and the Sorcerer's Stone",
"Year": "2001",
"imdbID": "tt0241527",
"Type": "movie",
"Poster": "https://m.media-amazon.com/images/M/MV5BNmQ0ODBhMjUtNDRhOC00MGQzLTk5MTAtZDliODg5NmU5MjZhXkEyXkFqcGdeQXVyNDUyOTg3Njg@._V1_SX300.jpg"
},
{
"Title": "Harry Potter and the Chamber of Secrets",
"Year": "2002",
"imdbID": "tt0295297",
"Type": "movie",
"Poster": "https://m.media-amazon.com/images/M/MV5BMjE0YjUzNDUtMjc5OS00MTU3LTgxMmUtODhkOThkMzdjNWI4XkEyXkFqcGdeQXVyMTA3MzQ4MTc0._V1_SX300.jpg"
},
{
"Title": "Harry Potter and the Prisoner of Azkaban",
"Year": "2004",
"imdbID": "tt0304141",
"Type": "movie",
"Poster": "https://m.media-amazon.com/images/M/MV5BMTY4NTIwODg0N15BMl5BanBnXkFtZTcwOTc0MjEzMw@@._V1_SX300.jpg"
}];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Movie app"),),

      // In Flutter plural and singular can indicate what is expected as component
        // child (singular) -> one component expected (Container, SingleChildScrollView, Padding...)
        // children (plural) -> one or more component expected (Row,Column, Stack)
      body:Column(
        children: [
          Row(
            children: [
              Expanded(
                  flex: 2,
                  child: TextField(decoration: InputDecoration(hintText: "Enter movie to search"),)),
              Expanded(
                flex:1,
                  child: TextButton(onPressed: (){}, child: Text("Search")))
            ],
          ),
          Expanded(
            child: ListView.builder(
              // How many rows are there => Always the length of your list/array
                itemCount: _movies.length,
                // What to show for each row
                itemBuilder: (context,index){
                  return ListTile(
                  title: Text(_movies[index]["Title"]!),
                    subtitle: Text(_movies[index]["Year"]!),
                    leading: Image.network(_movies[index]["Poster"]!),
                    trailing: Icon(Icons.chevron_right),
                  );
                }),
          )
        ],
      )
    );
  }

  /// The word Future - This method is a method that will be called Asynchronously
  ///  When there is the word future, this method needs to be called using
  ///   - async - await
  ///   - then ..
  ///   <G> => The return type of the function
  ///   If you are working with {} , this will be your Class
  ///   If you are working with [], this will be List<Class>
  Future<List<MovieSearch>> fetchMovies() async {
    // import http
    final response = await http
        .get(Uri.parse('https://www.omdbapi.com/?s=Harry&apikey=87d10179'));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      // If you are working with {}. this method will be your forth method
      // If you are working with [], this method will be your fifth method
      return MovieSearch.moviesFromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
