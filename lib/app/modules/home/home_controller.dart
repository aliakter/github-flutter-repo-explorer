import 'package:get/get.dart';
import 'package:hive/hive.dart';
import '../../data/repositories/github_repository.dart';
import '../../data/models/repo_model.dart';
import '../../config/hive_boxes.dart';

enum SortType { stars, updated }

class HomeController extends GetxController {
  final repos = <RepoModel>[].obs;
  final isLoading = false.obs;
  final sortType = SortType.stars.obs;

  final repo = GithubRepository();

  @override
  void onInit() {
    loadSort();
    fetch();
    super.onInit();
  }


  void loadSort() {
    final box = Hive.box(HiveBoxes.settingsBox);
    sortType.value = box.get('sort', defaultValue: SortType.stars);
  }


  void saveSort() {
    Hive.box(HiveBoxes.settingsBox).put('sort', sortType.value);
  }


  void fetch() async {
    isLoading(true);
    repos.value = await repo.getRepos();
    applySort();
    isLoading(false);
  }


  void applySort() {
    if (sortType.value == SortType.stars) {
      repos.sort((a, b) => b.stars.compareTo(a.stars));
    } else {
      repos.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
    }
    saveSort();
  }
}