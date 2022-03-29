import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final int starCount;
  final double rating;
  final Color color;

  const StarRating(
      {Key? key,
      this.starCount = 5,
      this.rating = .0,
      this.color = Colors.orange})
      : super(key: key);

  Widget buildStar(int index) {
    Icon icon;
    if (index >= rating) {
      icon = const Icon(
        Icons.star_border,
        color: Colors.white,
      );
    } else if (index > rating - 1 && index < rating) {
      icon = Icon(
        Icons.star_half,
        color: color,
      );
    } else {
      icon = Icon(
        Icons.star,
        color: color,
      );
    }
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center ,
      children: List.generate(starCount, (index) => buildStar(index)));
  }
}
