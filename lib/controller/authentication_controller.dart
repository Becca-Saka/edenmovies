import 'package:edenmovies/app/routes/app_pages.dart';
import 'package:edenmovies/helpers/navigation_helper.dart';
import 'package:edenmovies/services/authentication_service.dart';
import 'package:flutter/cupertino.dart';

class AuthenticationController extends ChangeNotifier {
  String get email => _email;
  String _email = '';
  String get name => _name;
  String _name = '';
  String get password => _password;
  String _password = '';
  final AuthenticatinService _authenticationService = AuthenticatinService();
  final NavigationHelper _navigator = NavigationHelper();
  void updateEmail(String email) {
    _email = email;
    notifyListeners();
  }

  void updateName(String name) {
    _name = name;
    notifyListeners();
  }

  void updatePassword(String password) {
    _password = password;
    notifyListeners();
  }

  gotoLogin() => _navigator.navigateTo(Routes.login);
  gotoSignUp() => _navigator.back();

  void login() {
    _authenticationService.signOut();
    _authenticationService.signIn(email, password);
  }

  Future<void> signUp() async =>
      await _authenticationService.signUp(email, password, name);
     Future<bool> isSignIn() => _authenticationService.isSignIn();
}
