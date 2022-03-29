import 'package:edenmovies/controller/authentication_controller.dart';
import 'package:edenmovies/controller/feed_controller.dart';
import 'package:edenmovies/helpers/navigation_helper.dart';
import 'package:edenmovies/helpers/snackbar_helper.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;
///Used to inject service so we can acess anywhere
void setupLocator() {
  locator.registerLazySingleton(() => NavigationHelper());
  locator.registerLazySingleton(() => SnackBarHelper());
  locator.registerLazySingleton(() => FeedController());
  locator.registerLazySingleton(() => AuthenticationController());
}