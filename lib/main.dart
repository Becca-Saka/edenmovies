import 'package:edenmovies/app/locator.dart';
import 'package:edenmovies/app/routes/app_pages.dart';
import 'package:edenmovies/controller/authentication_controller.dart';
import 'package:edenmovies/helpers/snackbar_helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'helpers/navigation_helper.dart';

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
    return ChangeNotifierProvider(
      create: (_) => AuthenticationController(),
      child: MaterialApp(
        navigatorKey: NavigationHelper.navigatorKey,
        scaffoldMessengerKey: SnackBarHelper.rootScaffoldMessengerKey,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: AppPages.onGenerateRoute,
        initialRoute: AppPages.initial,
      ),
    );
  }
}
