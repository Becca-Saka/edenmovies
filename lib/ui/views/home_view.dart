import 'package:edenmovies/app/app_state.dart';
import 'package:edenmovies/controller/feed_controller.dart';
import 'package:edenmovies/ui/shared/const_color.dart';
import 'package:edenmovies/ui/widgets/horizontal_list_item.dart';
import 'package:edenmovies/ui/widgets/loading_screen.dart';
import 'package:flutter/material.dart';

import 'base_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<FeedController>(builder: (context, controller, child) {
      return Scaffold(
        backgroundColor: appColor2,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: controller.state == AppState.busy
                ? const LoadingPlaceholder()
                : SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Hello ${controller.currentUser.name}',
                          style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          'Let\'s explore the upcoming movies',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                        _popularMovies(
                            controller, MediaQuery.of(context).size.height),
                        ListView(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          children: controller.genres
                              .map((e) => HorizontalMovieList(
                                  movies: controller.movies, title: e))
                              .toList(),
                        ),
                      ],
                    ),
                  ),
          ),
        ),
      );
    });
  }

  Column _popularMovies(FeedController controller, double height) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 35,
        ),
        const Text(
          'Popular Movies',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: height * 0.3,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.popular.length,
            itemBuilder: (context, index) {
              final item = controller.popular[index];
              dynamic img = NetworkImage(
                item.posterurl,
              );
              return Row(
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {
                      controller.navigateToSingleItem(
                          item, '${item.id}+popular');
                    },
                    child: Hero(
                      tag: '${item.id}+popular',
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: img,
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
                                    Text(item.title,
                                        style: const TextStyle(
                                            fontSize: 26,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white)),
                                    Text(item.year,
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
                    ),
                  ),
                  SizedBox(
                    width: index == controller.popular.length - 1 ? 0 : 20,
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

