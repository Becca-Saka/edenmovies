import 'package:edenmovies/models/movie_details.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class HorizontalMovieList extends StatelessWidget {
  final List<MovieDetails> movies;
  final String title;
  const HorizontalMovieList({
    Key? key,
    required this.movies,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    var list = [];
    list = movies.where((element) => element.genres.contains(title)).toList();
    list.shuffle();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: height / 5,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: list.length,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: FancyShimmerImage(
                      imageUrl: list[index].posterurl,
                      boxFit: BoxFit.cover,
                      errorWidget: const Icon(Icons.error),
                      width: 100,
                      
                      // height: 100,
                    ),
                  ),
                  // Image.network(
                  //   list[index].posterurl,
                  //   fit: BoxFit.cover,
                  //   errorBuilder: (context, url, error) {
                  //     return const Icon(Icons.error);
                  //   },
                  // ),
                  SizedBox(
                    width: index == list.length - 1 ? 0 : 5,
                  ),
                ],
              );
            },
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
