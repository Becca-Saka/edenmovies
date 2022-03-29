import 'package:http/http.dart' as http;


class ApiRepository {
  Future<String> getData() async {
    final url = Uri.parse(
        'https://raw.githubusercontent.com/FEND16/movie-json-data/master/json/movies-coming-soon.json');
    final header = {'Content-Type': 'application/json'};
    final repo = await http.get(url, headers: header);
    return repo.body;
  }
}
