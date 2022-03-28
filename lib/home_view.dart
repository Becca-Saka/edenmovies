import 'package:edenmovies/helpers/api_base_helper.dart';
import 'package:edenmovies/helpers/api_repository.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({ Key? key }) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
   
   @override
  void initState() {
   ApiRepository().getFeed();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
    );
  }
}