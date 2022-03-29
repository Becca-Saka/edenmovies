import 'package:edenmovies/models/movie_details.dart';
import 'package:edenmovies/ui/views/login_view.dart';
import 'package:edenmovies/ui/views/main_view.dart';
import 'package:edenmovies/ui/views/signup_view.dart';
import 'package:edenmovies/ui/views/single_movie_view.dart';
import 'package:edenmovies/ui/views/startup_view.dart';
import 'package:flutter/material.dart';
part 'app_routes.dart';

class AppPages {
  static const initial = Routes.signup;

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.root:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const StartUpView(),
          settings: settings,
        );
      case Routes.login:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const LoginView(),
          settings: settings,
        );
      case Routes.signup:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const SignUpView(),
          settings: settings,
        );

      case Routes.mainView:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const MainView(),
          settings: settings,
        );

      case Routes.singleFeedItem:
        return MaterialPageRoute<dynamic>(
          builder: (context) {
            final arg = settings.arguments as Map;
            return SingleItemView(
              movieDetails: arg['movieDetails'] as MovieDetails,
              tag: arg['tag'] as String,
            );
          },
          settings: settings,
        );
      // case Routes.uploadView:
      //   return MaterialPageRoute<dynamic>(
      //     builder: (context) => const UploadView(),
      //     settings: settings,
      //   );
      // case Routes.rearrangeView:
      //   return MaterialPageRoute<dynamic>(
      //     builder: (context) => const ReArrageImagesView(),
      //     settings: settings,
      //   );
      // case Routes.singleFeedItem:
      //   return MaterialPageRoute<dynamic>(
      //     builder: (context) {
      //       final arg = settings.arguments as FeedArgumnet;
      //       return SingleFeedView(
      //         feedArgument: arg,
      //       );
      //     },
      //     settings: settings,
      //   );
      // case Routes.commetsView:
      //   return MaterialPageRoute<dynamic>(
      //     builder: (context) {
      //       final arg = settings.arguments as FeedModel;
      //       return CommentView(
      //         feed: arg,
      //       );
      //     },
      //     settings: settings,
      //   );

      default:
        return MaterialPageRoute<dynamic>(
          builder: (context) => const SignUpView(),
          settings: settings,
        );
    }
  }

  // static final routes = [
  //   const MaterialPage(
  //     name: Routes.root,
  //     child: HomeView(),
  //   ),
  //   const MaterialPage(
  //     name: Routes.signup,
  //     child: SignUpView(),
  //   ),
  // ];
}
