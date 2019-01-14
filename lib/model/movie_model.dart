import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart'  as http;

import '../bloc/api_key.dart';


class MovieModel{
  final String title, posterPath, overview;

 MovieModel({this.title, this.posterPath, this.overview});

 MovieModel.fromJson(Map json)
      : title = json['title'],
      posterPath = json['poster_path'],
      overview = json['overview'];

}

class API{
  final http.Client _client = http.Client();

  static const String _url= 'https://api.themoviedb.org/3/search/movie?api_key=$api_key&query={1}';


  Future<List<MovieModel>> get(String query) async{
    List<MovieModel> list = [];

    await _client
      .get(Uri.parse(_url.replaceFirst("{1}", query)))
      .then((res) => res.body) // get the body
      .then(json.decode)
      .then((json)=>json['results'])
      .then((movies)=>movies.forEach((movie)=>list.add(MovieModel.fromJson(movie))));

  return list;

  }

}