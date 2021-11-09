import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

class CardSwipper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
        width: double.infinity,
        height: size.height * 0.6,
        child: Swiper(
          layout: SwiperLayout.STACK,
          itemCount: 10,
          itemWidth: size.width * 0.8,
          itemHeight: size.height * 0.6,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'pelicula', arguments: index);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: FadeInImage(
                    fit: BoxFit.cover,
                    placeholder: AssetImage('assets/no-image.jpg'),
                    image: NetworkImage('https://picsum.photos/200/300')),
              ),
            );
          },
        ));
  }
}
