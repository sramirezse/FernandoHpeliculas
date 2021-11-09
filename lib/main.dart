import 'package:flutter/material.dart';
import 'package:peliculas/screens/screens.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Peliculas App',
      initialRoute: 'home',
      routes: {
        'home': (BuildContext context) => HomeScreen(),
        'pelicula': (BuildContext context) => DetailsScreen()
      },
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(
          color: Colors.black87,
          textTheme: TextTheme(
            title: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
        ),
      ),
    );
  }
}
