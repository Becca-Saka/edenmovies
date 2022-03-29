import 'dart:async';
import 'dart:io';

import 'package:edenmovies/helpers/snackbar_helper.dart';
import 'package:http/http.dart' as http;

class ApiRepository {
  final _baseUrl =
      'https://raw.githubusercontent.com/FEND16/movie-json-data/master/json/movies-coming-soon.json';

  final header = {'Content-Type': 'application/json'};

  Future<String?> getData() async {
    try {
      final url = Uri.parse(_baseUrl);

      final repo = await http.get(url, headers: header).timeout(
            const Duration(seconds: 15),
          );
      return repo.body;
    } on TimeoutException {
      SnackBarHelper.showErrorSnackBar(
          'An error occurred, plese check your internet connection');
    } on SocketException {
      SnackBarHelper.showErrorSnackBar('No internet connection');
    } catch (e) {
      SnackBarHelper.showErrorSnackBar(
          'Something went wrong, please try again');
    }
    return null;
  }
}
