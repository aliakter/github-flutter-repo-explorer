import 'package:get/get.dart';
import 'package:github_flutter_repo_explorer/data/datasources/github_remote_datasource.dart';
import 'package:github_flutter_repo_explorer/data/local_datasources/repo_local_datasource.dart';
import 'package:github_flutter_repo_explorer/data/repositories/repo_repository_impl.dart';
import 'package:github_flutter_repo_explorer/presentation/controllers/repo_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RepoController(
      RepoRepositoryImpl(
        GithubRemoteDataSource(),
        RepoLocalDataSource(),
      ),
    ));
  }
}