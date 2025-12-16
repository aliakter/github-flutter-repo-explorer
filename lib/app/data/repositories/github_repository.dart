import 'package:hive/hive.dart';
import '../models/repo_model.dart';
import '../providers/github_api_provider.dart';
import '../../config/hive_boxes.dart';

class GithubRepository {
  final api = GithubApiProvider();

  Future<List<RepoModel>> getRepos() async {
    final box = Hive.box(HiveBoxes.repoBox);

    try {
      final data = await api.fetchRepos();
      final repos = data.map((e) => RepoModel.fromJson(e)).toList();

      box.put('repos', repos.map((e) => e.toJson()).toList());
      return repos;
    } catch (_) {
      final cached = box.get('repos');
      if (cached != null) {
        return (cached as List)
            .map((e) => RepoModel.fromJson(e))
            .toList();
      }
      rethrow;
    }
  }
}