import 'package:dio/dio.dart';
import 'package:github_flutter_repo_explorer/app/data/models/repo_model.dart';
import 'package:github_flutter_repo_explorer/app/config/flavor_config.dart';

class ApiService {
  late final Dio _dio;

  ApiService() {
    _dio = Dio(
      BaseOptions(
        baseUrl: "https://api.github.com", //flavor based
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );
  }

  Future<List<RepoModel>> fetchRepos() async {
    final response = await _dio.get(
      '/search/repositories',
      queryParameters: {
        'q': 'Flutter',
        'sort': 'stars',
        'order': 'desc',
        'per_page': 50,
      },
    );

    final List items = response.data['items'];
    return items.map((e) => RepoModel.fromJson(e)).toList();
  }
}
