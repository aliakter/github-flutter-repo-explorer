import 'package:get/get.dart';
import 'package:github_flutter_repo_explorer/domain/entities/repo_entity.dart';
import 'package:github_flutter_repo_explorer/domain/repositories/repo_repository.dart';
import 'package:hive/hive.dart';

enum SortType { stars, updated }

class RepoController extends GetxController {
  final RepoRepository repository;

  RepoController(this.repository);

  var repos = <RepoEntity>[].obs;
  var loading = false.obs;
  var sortType = SortType.stars.obs;

  @override
  void onInit() {
    _loadSort();
    fetchRepos();
    super.onInit();
  }

  void fetchRepos() async {
    try {
      loading.value = true;
      repos.value = await repository.fetchRepos();
      _sort();
    } catch (e) {
      Get.snackbar('Error', 'No Internet & No Cached Data');
    } finally {
      loading.value = false;
    }
  }

  void toggleSort() {
    sortType.value = sortType.value == SortType.stars
        ? SortType.updated
        : SortType.stars;
    Hive.box('settings').put('sort', sortType.value.index);
    _sort();
  }

  void _loadSort() {
    final index = Hive.box('settings').get('sort', defaultValue: 0);
    sortType.value = SortType.values[index];
  }

  void _sort() {
    if (sortType.value == SortType.stars) {
      repos.sort((a, b) => b.stars.compareTo(a.stars));
    } else {
      repos.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
    }
  }
}