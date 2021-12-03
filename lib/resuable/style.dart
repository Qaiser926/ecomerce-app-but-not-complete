import 'package:flutter/material.dart';

final text_style = TextStyle(fontSize: 25);

Color white = Colors.white;
Color appbarColor = Colors.deepPurple;

class carouselImage {
  String image;
  String text;

  carouselImage({required this.image, required this.text});
}

List image = [
  carouselImage(image: 'photo/qaiser.jpg', text: 'Qaiser'),
  carouselImage(image: 'photo/qaiser.jpg', text: 'Qaiser farooq'),
  carouselImage(image: 'photo/qaiser.jpg', text: 'Qaiser khan'),
];

BoxDecoration decoration() {
  return BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.white,
      gradient: LinearGradient(colors: [Colors.red.shade300, Colors.blue]));
}

BoxDecoration addproduct_decoration() {
  return BoxDecoration(
    color: Colors.grey.withOpacity(0.3),
    borderRadius: BorderRadius.circular(14),
  );
}
