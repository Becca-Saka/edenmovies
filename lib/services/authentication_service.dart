import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edenmovies/app/locator.dart';
import 'package:edenmovies/app/routes/app_pages.dart';
import 'package:edenmovies/controller/feed_controller.dart';
import 'package:edenmovies/helpers/navigation_helper.dart';
import 'package:edenmovies/helpers/snackbar_helper.dart';
import 'package:edenmovies/models/user_details.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticatinService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final CollectionReference _userCollectionRef =
      FirebaseFirestore.instance.collection('Users');

  final _navigator = locator<NavigationHelper>();

  Future<void> signUp(String email, String password, String name) async {
    try {
      _navigator.showLoadingDialogWithText(msg: 'Signing up...');
      User? user = (await _firebaseAuth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user;
      if (user != null) {
        await saveUserData(
          email,
          name,
          user.uid,
        );
        await getUserData();
        _navigator.closeAllAndNavigateTo(Routes.mainView);
      }
    } on FirebaseAuthException catch (e) {
      log('Error: $e');
      _navigator.back();
      final errorMessage = getMessageFromErrorCode(e);
      SnackBarHelper.showErrorSnackBar(errorMessage);
    } catch (e) {
      _navigator.back();
      log(e.toString());
    }
  }

  Future<void> signIn(String email, String password) async {
    try {
      _navigator.showLoadingDialogWithText(msg: 'Signing in...');
      User? user = (await _firebaseAuth.signInWithEmailAndPassword(
              email: email, password: password))
          .user;
      if (user != null) {
        await getUserData();
        _navigator.closeAllAndNavigateTo(Routes.mainView);
      }
    } on FirebaseAuthException catch (e) {
      log('Error: $e');
      _navigator.back();
      final errorMessage = getMessageFromErrorCode(e);
      SnackBarHelper.showErrorSnackBar(errorMessage);
    } catch (e) {
      _navigator.back();
      log(e.toString());
    }
  }

  Future<void> saveUserData(
    String email,
    String name,
    String userId,
  ) async {
    UserDetails userDetails = UserDetails(
      email: email,
      name: '${name[0].toUpperCase()}${name.substring(1).toLowerCase()}',
      uid: userId,
    );

    await _userCollectionRef.doc(userDetails.uid).set(userDetails.toJson());
  }

  Future<void> getUserData() async {
    final u = _firebaseAuth.currentUser!.uid;
    final res = await _userCollectionRef.doc(u).get();
    if (res.data() != null) {
      final data = res.data() as Map<String, dynamic>;
      final user = UserDetails.fromJson(data);
      locator<FeedController>().updateUserDetails(user);
    }
  }

 Future<void> saveUserWatchList(UserDetails user) async => await _userCollectionRef
      .doc(user.uid)
      .update({'watchList': user.watchList});

  Future<void> signOut() async => _firebaseAuth.signOut();

  Future<bool> isSignIn() async {
    User? user = _firebaseAuth.currentUser;
    if (user != null) {
      final result = await user.getIdTokenResult(true);
      await getUserData();
      return result.token != null;
    }
    log('returning false');
    return false;
  }
}

String getMessageFromErrorCode(FirebaseAuthException e) {
  String msg;
  switch (e.code) {
    case "ERROR_EMAIL_ALREADY_IN_USE":
    case "account-exists-with-different-credential":
    case "email-already-in-use":
      msg = "Email already used. Go to login page.";
      break;
    case "ERROR_WRONG_PASSWORD":
    case "wrong-password":
      msg = "Wrong email/password combination.";
      break;
    case "ERROR_USER_NOT_FOUND":
    case "user-not-found":
      msg = "No user found with this email.";
      break;
    case "ERROR_USER_DISABLED":
    case "user-disabled":
      msg = "User disabled.";
      break;
    case "ERROR_TOO_MANY_REQUESTS":
    case "operation-not-allowed":
      msg = "Too many requests to log into this account.";
      break;
    case "ERROR_OPERATION_NOT_ALLOWED":
      msg = "Server error, please try again later.";
      break;
    case "ERROR_INVALID_EMAIL":
    case "invalid-email":
      msg = "Email address is invalid.";
      break;
    default:
      msg = "Login failed. Please try again.";
      break;
  }
  return msg;
}
