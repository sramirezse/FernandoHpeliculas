import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:peliculas/models/now_paying_response.dart';

class MoviesProvider extends ChangeNotifier {
  String _apiKey = 'a2ebfc0f86b1bb51272bcb43c7b16065';
  String _baseUrl = 'api.themoviedb.org';
  String _language = 'es-Es';
  MoviesProvider() {
    print('constructor');
    this.getOnDisplayMovies();
  }
  getOnDisplayMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/now_playing', {
      'api_key': _apiKey,
      'language': _language,
      'page': '1',
    });

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);
    print(nowPlayingResponse.results[0].title);
  }
}
