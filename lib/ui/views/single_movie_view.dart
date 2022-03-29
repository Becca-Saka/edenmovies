import 'dart:ui';
import 'package:edenmovies/controller/feed_controller.dart';
import 'package:edenmovies/models/movie_details.dart';
import 'package:edenmovies/ui/shared/const_color.dart';
import 'package:edenmovies/ui/views/base_view.dart';
import 'package:edenmovies/ui/widgets/star_rating.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class SingleItemView extends StatelessWidget {
  final MovieDetails movieDetails;

  final String tag;
  const SingleItemView(
      {Key? key, required this.movieDetails, required this.tag})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<FeedController>(builder: (context, controller, child) {
      return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: appColor2,
        appBar:
            AppBar(backgroundColor: Colors.transparent, elevation: 0, actions: [
          IconButton(
              onPressed: () {
                controller.saveWatchList(movieDetails);
              },
              icon: Icon(
                  controller.currentUser.watchList.contains(movieDetails.id)
                      ? Icons.favorite
                      : Icons.favorite_border))
        ]),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 1.8,
                    child: ImageFiltered(
                      imageFilter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                      child: FancyShimmerImage(
                        imageUrl: movieDetails.posterurl,
                        boxFit: BoxFit.cover,
                        errorWidget: const Placeholder(
                          color: Colors.grey,
                        ),
                        width: 100,
                      ),
                    ),
                  ),
                  Hero(
                    tag: tag,
                    child: SizedBox(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height / 1.8,
                      child: FancyShimmerImage(
                        imageUrl: movieDetails.posterurl,
                        boxFit: BoxFit.fitHeight,
                        errorWidget: const Placeholder(
                          color: Colors.grey,
                        ),
                        width: 100,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  movieDetails.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              Center(
                child: Text(
                  '${movieDetails.year} $seprator ${movieDetails.genres.join(', ')} $seprator ${playTime()}',
                  style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              StarRating(
                rating: movieDetails.ratings.reduce((a, b) => a + b) /
                    movieDetails.ratings.length,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Story Line',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                '${movieDetails.storyline} ',
                style: TextStyle(
                    color: Colors.grey[500],
                    letterSpacing: 0.7,
                    height: 1.5,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Cast & Crew',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              movieDetails.actors.isEmpty
                  ? Text(
                      'No Cast & Crew Found',
                      style: TextStyle(
                          color: Colors.grey[500],
                          letterSpacing: 0.7,
                          height: 1.5,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    )
                  : SizedBox(
                      height: 120,
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: movieDetails.actors.map((e) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: SizedBox(
                              width: 90,
                              height: 70,
                              child: Column(
                                // crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: FancyShimmerImage(
                                      imageUrl: 'https://picsum.photos/200/300',
                                      boxFit: BoxFit.cover,
                                      errorWidget: const Placeholder(
                                        color: Colors.grey,
                                      ),
                                      width: 90,

                                      height: 80,

                                      // height: 100,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(e,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.grey[500],
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400)),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
              const SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      );
    });
  }

  String get seprator => String.fromCharCodes(Runes('\u00B7'));

  String playTime() {
    if (movieDetails.duration.isEmpty) return '0';
    final time = movieDetails.duration.replaceAll('PT', '').replaceAll('M', '');
    final timer = int.parse(time);
    final hours = (timer ~/ 60);
    final d = timer - (hours * 60);
    return '${hours}h ${d}m';
  }
}
