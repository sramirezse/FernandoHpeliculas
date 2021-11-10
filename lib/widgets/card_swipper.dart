import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:peliculas/models/models.dart';

class CardSwipper extends StatelessWidget {
  final List<Movie> movies;

  const CardSwipper({
    Key? key,
    required this.movies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (this.movies.length == 0)
      return Container(
        width: double.infinity,
        height: size.height * 0.5,
        child: Center(child: CircularProgressIndicator()),
      );

    return Container(
        width: double.infinity,
        height: size.height * 0.6,
        child: Swiper(
          layout: SwiperLayout.STACK,
          itemCount: movies.length,
          itemWidth: size.width * 0.8,
          itemHeight: size.height * 0.6,
          itemBuilder: (BuildContext context, int index) {
            final movie = movies[index];
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'pelicula');
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: FadeInImage(
                    fit: BoxFit.cover,
                    placeholder: AssetImage('assets/no-image.jpg'),
                    image: NetworkImage(movie.fullPosterImg)),
              ),
            );
          },
        ));
  }
}
