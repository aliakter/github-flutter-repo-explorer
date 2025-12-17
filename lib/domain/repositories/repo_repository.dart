import 'package:github_flutter_repo_explorer/domain/entities/repo_entity.dart';

abstract class RepoRepository {
  Future<List<RepoEntity>> fetchRepos();
}