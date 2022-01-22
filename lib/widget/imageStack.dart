///
/// widget/imageStack.dart
///
import 'package:flutter/material.dart';

Widget imageStack(String urlImage, String titleImage, String textImage) {
  return Column(children: <Widget>[
    Stack(children: [
      Image.network(urlImage, height: 400),
      Positioned( 
        bottom: 15,
        left: 0,
        right: 0,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.75)
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              titleImage,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
      ),
    ]),
    Text(textImage),
  ]);
}