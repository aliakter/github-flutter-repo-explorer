import 'package:github_flutter_repo_explorer/data/models/repo_model.dart';
import 'package:hive/hive.dart';

class RepoLocalDataSource {
  final box = Hive.box('repos');

  void cacheRepos(List<RepoModel> repos) {
    final list = repos.map((e) => e.toCache()).toList();
    box.put('data', list);
  }

  List<RepoModel> getCachedRepos() {
    final List list = box.get('data', defaultValue: []);
    return list.map((e) => RepoModel.fromCache(e)).toList();
  }
}
