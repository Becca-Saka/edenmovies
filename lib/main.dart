import 'package:edenmovies/app/barrel.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: NavigationHelper.navigatorKey,
      scaffoldMessengerKey: SnackBarHelper.rootScaffoldMessengerKey,
      title: 'Eden Movies',
      theme: ThemeData(primaryColor: appColor),
      onGenerateRoute: AppPages.onGenerateRoute,
      initialRoute: AppPages.initial,
    );
  }
}
