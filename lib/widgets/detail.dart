import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final String imdbId;
  const DetailPage({super.key, required this.imdbId});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail"),),
      body: Text("Detail page for ${widget.imdbId}"),
    );
  }
}
