import 'package:flutter/material.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:peliculas/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                print('Search');
              },
            ),
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {
                print('More');
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CardSwipper(movies: moviesProvider.onDisplayMovies),
              SizedBox(
                height: 5,
              ),
              MovieSlider(
                movies: moviesProvider.popularMovies,
                title: 'Populares',
              ),
            ],
          ),
        ));
  }
}
