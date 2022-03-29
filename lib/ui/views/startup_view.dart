import 'package:edenmovies/app/locator.dart';
import 'package:edenmovies/app/routes/app_pages.dart';
import 'package:edenmovies/controller/authentication_controller.dart';
import 'package:edenmovies/helpers/navigation_helper.dart';
import 'package:edenmovies/ui/shared/const_color.dart';
import 'package:flutter/material.dart';

class StartUpView extends StatefulWidget {
  const StartUpView({Key? key}) : super(key: key);

  @override
  State<StartUpView> createState() => _StartUpViewState();
}

class _StartUpViewState extends State<StartUpView> {
  @override
  Future<void> didChangeDependencies() async {
    await _checkLogin();
    super.didChangeDependencies();
  }

  Future<void> _checkLogin() async {
    final auth = locator<AuthenticationController>();
    final _navigator = locator<NavigationHelper>();
    final status = await auth.isSignIn();
    if (status) {
      _navigator.closeAllAndNavigateTo(Routes.mainView);
    } else {
      _navigator.closeAllAndNavigateTo(Routes.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    return Scaffold(
      backgroundColor: appColor,
      body: Center(
        child: SizedBox(
          height: height /5,
          width: width / 4,
          child: Image.asset(
            'assets/applogoicon.png',
          ),
        ),
      ),
    );
  }
}
