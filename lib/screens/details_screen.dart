import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String movie =
        ModalRoute.of(context)?.settings.arguments.toString() ?? 'no hay ruta';
    return Scaffold(
      body: Container(
        child: Center(
          child: Text('$movie'),
        ),
      ),
    );
  }
}
