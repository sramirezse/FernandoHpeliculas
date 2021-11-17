import 'package:flutter/material.dart';
import 'package:peliculas/models/models.dart';

class MovieSlider extends StatelessWidget {
  final List<Movie> movies;
  final String? title;
  const MovieSlider({
    Key? key,
    required this.movies,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 270,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (this.title != null)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                this.title!,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movies.length,
              itemBuilder: (BuildContext context, int index) =>
                  _MovieContainer(movie: movies[index]),
            ),
          ),
        ],
      ),
    );
  }
}

class _MovieContainer extends StatelessWidget {
  final Movie movie;
  const _MovieContainer({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 190,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'pelicula', arguments: null);
              print(movie);
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'),
                image: NetworkImage(movie.fullPosterImg),
                width: 130,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 5),
          Text(movie.title,
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis),
        ],
      ),
    );
  }
}
