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
      appBar: AppBar(title: Text("Detail"),),
      body: _movie == null ? Center(child: CircularProgressIndicator(),) :
      Column(
        children: [
          Text(_movie!.title), /// I AM USING FORCE UNWRAP ! BECAUSE I AM SURE IS NOT NULL
        ],
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
