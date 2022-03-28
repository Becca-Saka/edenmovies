import 'dart:convert';
import 'dart:developer';
import 'package:edenmovies/helpers/api_repository.dart';
import 'package:edenmovies/horizontal_list_item.dart';
import 'package:edenmovies/models/movie_details.dart';
import 'package:flutter/material.dart';

//TODO: add on image error widget
class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<MovieDetails> movies = [];
  List<MovieDetails> popular = [];
  List<String> genres = [];
  @override
  void initState() {
    getData();

    super.initState();
  }

  getData() async {
    final data = await ApiRepository().getData();
    final jsonData = json.decode(data) as List<dynamic>;
    movies = jsonData.map((movie) => MovieDetails.fromJson(movie)).toList();
    _parseDataList();
    setState(() {});

    log('jsonData: ${popular.length}');
  }

  _parseDataList() {
    for (var element in movies) {
      for (var element in element.genres) {
        if (!genres.contains(element)) {
          genres.add(element);
        }
      }
    }
    log(genres.length.toString());
    movies = movies.map((e) {
      if (e.imdbRating.runtimeType == String) {
        e.imdbRating = 0.0;
      }

      return e;
    }).toList();
    popular = movies.where((movie) => movie.imdbRating >= 7.5).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF272362).withOpacity(0.4),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Hello User',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  'Lets explore the upcoming movies',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
                _popularMovies(context),
                ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: genres
                      .map((e) => HorizontalMovieList(movies: movies, title: e))
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column _popularMovies(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 30,
        ),
        const Text(
          'Popular Movies',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: popular.length,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  popular[index].posterurl,
                                ),
                                fit: BoxFit.cover,
                              ),
                              color: Colors.white,
                            ),
                            child: ColoredBox(
                                color: Colors.black.withOpacity(0.5)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(18),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(popular[index].title,
                                    style: const TextStyle(
                                        fontSize: 26,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                                Text(popular[index].year,
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white)),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: index == popular.length - 1 ? 0 : 20,
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
