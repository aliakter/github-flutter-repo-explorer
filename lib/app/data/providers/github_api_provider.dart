import 'dart:convert';
import 'package:http/http.dart' as http;

class GithubApiProvider {
  Future<List<dynamic>> fetchRepos() async {
    final url = Uri.parse(
      'https://api.github.com/search/repositories?q=flutter&sort=stars&order=desc&per_page=50',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      return json.decode(response.body)['items'];
    } else {
      throw Exception('Failed to load repositories');
    }
  }
}