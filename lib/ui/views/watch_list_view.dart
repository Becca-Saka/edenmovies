import 'dart:developer';

import 'package:edenmovies/controller/feed_controller.dart';
import 'package:edenmovies/ui/shared/const_color.dart';
import 'package:edenmovies/ui/views/base_view.dart';
import 'package:flutter/material.dart';

class WatchListView extends StatelessWidget {
  const WatchListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<FeedController>(
        onModelReady: (controller) {},
        builder: (context, controller, child) {
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
                      GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 4,
                          childAspectRatio: 0.6,
                        ),
                        itemBuilder: (context, index) {
                          return Image.network(
                              controller.watchList[index].posterurl);
                        },
                        itemCount: controller.watchList.length,
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
