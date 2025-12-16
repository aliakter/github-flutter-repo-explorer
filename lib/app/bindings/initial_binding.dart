import 'package:get/get.dart';
import 'package:github_flutter_repo_explorer/app/data/services/api_service.dart';
import 'package:github_flutter_repo_explorer/app/data/services/local_storage_service.dart';
import 'package:github_flutter_repo_explorer/app/modules/home/home_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ApiService());
    // Get.put(LocalStorageService());
    Get.put(HomeController());
  }
}
