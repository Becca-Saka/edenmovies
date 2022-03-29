import 'dart:convert';
import 'dart:developer';

import 'package:edenmovies/app/locator.dart';
import 'package:edenmovies/app/routes/app_pages.dart';
import 'package:edenmovies/app/app_state.dart';
import 'package:edenmovies/helpers/api_repository.dart';
import 'package:edenmovies/helpers/navigation_helper.dart';
import 'package:edenmovies/models/movie_details.dart';
import 'package:edenmovies/models/user_details.dart';
import 'package:edenmovies/services/authentication_service.dart';

class FeedController extends StateController {
  List<MovieDetails> movies = [];
  List<MovieDetails> popular = [];
  List<MovieDetails> get watchList => movies
      .where((movie) => currentUser.watchList.contains(movie.id))
      .toList();
  List<String> genres = [];

  final NavigationHelper _navigator = locator<NavigationHelper>();
  UserDetails currentUser = UserDetails();

  var currentIndex = 0;

  getData() async {
    final data = await ApiRepository().getData();
    final jsonData = json.decode(data) as List<dynamic>;
    movies = jsonData.map((movie) => MovieDetails.fromJson(movie)).toList();
    _parseDataList();
    log('${popular.length} ${movies.length} ');
    notifyListeners();
  }

  _parseDataList() {
    for (var element in movies) {
      for (var element in element.genres) {
        if (!genres.contains(element)) {
          genres.add(element);
        }
      }
    }
    movies = movies.map((e) {
      if (e.imdbRating.runtimeType == String) {
        e.imdbRating = 0.0;
      }

      return e;
    }).toList();
    popular = movies.where((movie) => movie.imdbRating >= 7.5).toList();
  }

  navigateToSingleItem(MovieDetails movieDetails, String tag) {
    _navigator.navigateTo(Routes.singleFeedItem,
        arguments: {'movieDetails': movieDetails, 'tag': tag});
  }

  void onTabChanged(int value) {
    currentIndex = value;
    notifyListeners();
  }

  void updateUserDetails(UserDetails user) {
    currentUser = user;
    notifyListeners();
  }

  saveWatchList(MovieDetails movie) async {
    List<String> list = [...currentUser.watchList];
    list.contains(movie.id) ? list.remove(movie.id) : list.add(movie.id);
    currentUser.watchList = list;
    notifyListeners();
    await AuthenticatinService().saveUserWatchList(currentUser);
  }

  getUserWatchList() {
    notifyListeners();
  }
}
