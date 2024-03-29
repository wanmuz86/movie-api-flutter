import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_detail.dart';
import 'package:http/http.dart' as http;

class DetailPage extends StatefulWidget {
  final String imdbId;
  const DetailPage({super.key, required this.imdbId});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  MovieDetail? _movie;
  // movie will be null for a split of second, before the API call
  // We declare as optional
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  void loadData(){
    fetchMovie().then((value) => setState((){
      _movie = value;
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail"), backgroundColor: Colors.red,),
      body: _movie == null ? Center(child: CircularProgressIndicator(),) :
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(_movie!.title, style: TextStyle(fontSize: 32, color: Colors.red,),textAlign: TextAlign.center,), /// I AM USING FORCE UNWRAP ! BECAUSE I AM SURE IS NOT NULL
              SizedBox(height: 8,),
              Image.network(_movie!.poster),
              SizedBox(height: 8,),
              Text(_movie!.actors),
              SizedBox(height: 8,),
              Text(_movie!.runtime),
              SizedBox(height: 8,),
              Text(_movie!.year),
              SizedBox(height: 8,),
              Text(_movie!.plot, textAlign: TextAlign.center,),
              SizedBox(height: 8,),
              Text(_movie!.rated),
              SizedBox(height: 8,),
              Text(_movie!.type),
              SizedBox(height: 8,),
              Text("Rating", style: TextStyle(fontSize: 20),),
              ListView.builder(
                  shrinkWrap: true, // to stop the scroll behaviour and shrink it to the content
                  itemCount: _movie!.ratings.length,
                  itemBuilder: (context, index){
                    var rating = _movie!.ratings[index];
                    return Card(
                      child: ListTile(
                        title: Text(rating.source),
                        subtitle: Text(rating.value),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
// Future - asynchoronouse
  // We work with {}, <ClassName>
  Future<MovieDetail> fetchMovie() async {
    final response = await http
        .get(Uri.parse('https://www.omdbapi.com/?i=${widget.imdbId}&apikey=87d10179'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      // Work with {}, call the forth method
      return MovieDetail.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
