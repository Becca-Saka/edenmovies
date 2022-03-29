import 'package:edenmovies/app/barrel.dart';
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
    List<MovieDetails> list = [];
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
          height: 20,
        ),
        SizedBox(
          height: height / 5,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: list.length,
            itemBuilder: (context, index) {
              final item = list[index];
              return Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        Routes.singleFeedItem,
                        arguments: {
                          'movieDetails': item,
                          'tag': '${item.id}+$title'
                        },
                      );
                    },
                    child: Hero(
                      tag: '${item.id}+$title',
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: FancyShimmerImage(
                          imageUrl: list[index].posterurl,
                          boxFit: BoxFit.cover,
                          errorWidget: const Placeholder(color: Colors.grey ,),
                          width: 100,
                        ),
                      ),
                    ),
                  ),
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
