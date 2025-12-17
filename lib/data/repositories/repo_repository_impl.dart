import 'package:github_flutter_repo_explorer/data/local_datasources/repo_local_datasource.dart';
import '../../domain/entities/repo_entity.dart';
import '../../domain/repositories/repo_repository.dart';
import '../datasources/github_remote_datasource.dart';

class RepoRepositoryImpl implements RepoRepository {
  final GithubRemoteDataSource remote;
  final RepoLocalDataSource local;

  RepoRepositoryImpl(this.remote, this.local);

  @override
  Future<List<RepoEntity>> fetchRepos() async {
    try {
      final repos = await remote.fetchRepos();
      local.cacheRepos(repos);
      return repos;
    } catch (_) {
      final cached = local.getCachedRepos();
      if (cached.isNotEmpty) return cached;
      rethrow;
    }
  }
}