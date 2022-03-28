import 'package:edenmovies/helpers/navigation_helper.dart';
import 'package:edenmovies/helpers/snackbar_helper.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;
///Used to inject service so we can acess anywhere
void setupLocator() {
  // locator.registerLazySingleton(() => SharedPreferenceService());
  // locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => NavigationHelper());
  locator.registerLazySingleton(() => SnackBarHelper());
  // locator.registerLazySingleton(() => ApiRepository());
  // locator.registerLazySingleton(() => AccountController());
  // locator.registerLazySingleton(() => FeedController(),);
  // locator.registerLazySingleton(() => AuthenticationController());
}