import 'dart:developer';

import 'package:edenmovies/controller/feed_controller.dart';
import 'package:edenmovies/ui/shared/const_color.dart';
import 'package:edenmovies/ui/views/base_view.dart';
import 'package:edenmovies/ui/views/watch_list_view.dart';
import 'package:flutter/material.dart';

import 'home_view.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<FeedController>(
      onModelReady: (controller) async {
      
      await controller.getData();

    },
      builder: (context, controller, child) {
      return Scaffold(
        
        backgroundColor: appColor2,
        body: getBody(controller),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 30,
          showSelectedLabels: false,
          showUnselectedLabels: false,
        backgroundColor: appColor5,
          unselectedItemColor: Colors.white,
          // selectedItemColor: appGreen,
          currentIndex: controller.currentIndex,
          iconSize: 30,
          onTap: controller.onTabChanged,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              activeIcon: Icon(Icons.favorite),
              label: 'Profile',
            ),
          ],
        ),
      );
    });
  }

  Widget getBody(FeedController controller) {
    List<Widget> pages = [
      const HomeView(),
      WatchListView()
    ];
    return IndexedStack(
      index: controller.currentIndex,
      children: pages,
    );
  }
}
