import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/repo_model.dart';
import '../../app/config/flavor_config.dart';

class GithubRemoteDataSource {
  Future<List<RepoModel>> fetchRepos() async {
    final response = await http.get(
      Uri.parse(
        "${FlavorConfig.baseUrl}/search/repositories?q=Flutter&sort=stars&per_page=50",
      ),
    );

    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      return (body['items'] as List).map((e) => RepoModel.fromJson(e)).toList();
    } else {
      throw Exception('API Error');
    }
  }
}
