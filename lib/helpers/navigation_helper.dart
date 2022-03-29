import 'package:edenmovies/ui/shared/const_color.dart';
import 'package:flutter/material.dart';

///Use to make navigation easier, Navigation is possible because we wont be making use of build context we will be using [NavigatorState] key instead
class NavigationHelper {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  Future<dynamic> navigateTo(String routeName, {Object? arguments}) {
    return navigatorKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> closeAndNavigateTo(String routeName, {Object? arguments}) {
    return navigatorKey.currentState!
        .popAndPushNamed(routeName, arguments: arguments);
  }
  closeAllAndNavigateTo(String routeName, {Object? arguments}) {
    return navigatorKey.currentState!
        .popUntil(ModalRoute.withName(routeName));
  }

  void back([Object? arguments]) {
    return navigatorKey.currentState!.pop([arguments]);
  }

  void showLoadingDialogWithText({required String msg}) {
    if (navigatorKey.currentContext != null) {
      showDialog(
        context: navigatorKey.currentContext!,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(appColor),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(msg),
              ],
            ),
          );
        },
      );
    }
  }
}
