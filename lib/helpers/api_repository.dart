import 'package:edenmovies/helpers/api_base_helper.dart';
import 'package:http/http.dart' as http; 
ApiBaseHelper _helper = ApiBaseHelper();

class ApiRepository {
  Future<String> getData() async {
    final url = Uri.parse('https://raw.githubusercontent.com/FEND16/movie-json-data/master/json/movies-coming-soon.json');
    final repo = await http.get(url);
    return repo.body;
  }
  
}
