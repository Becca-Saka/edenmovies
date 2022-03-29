import 'package:edenmovies/app/barrel.dart';
import 'package:flutter/material.dart';

class WatchListView extends StatelessWidget {
  const WatchListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<FeedController>(builder: (context, controller, child) {
      return Scaffold(
        backgroundColor: appColor2,
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
                    'Watch List',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'List of movies you have watched',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Visibility(
                    visible: controller.watchList.isNotEmpty,
                    replacement: SizedBox(
                      height: MediaQuery.of(context).size.height / 1.3,
                      child: const Center(
                        child: Text(
                          'No movies in your watch list',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 4,
                        childAspectRatio: 0.6,
                      ),
                      itemBuilder: (context, index) {
                        final item = controller.watchList[index];
                        return InkWell(
                          onTap: () {
                            controller.navigateToSingleItem(
                                item, '${item.id}+watchlist');
                          },
                          child: Hero(
                            tag: '${item.id}+watchlist',
                            child: Image.network(item.posterurl),
                          ),
                        );
                      },
                      itemCount: controller.watchList.length,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
