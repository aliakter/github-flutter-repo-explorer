import 'package:get/get.dart';
import 'package:github_flutter_repo_explorer/app/modules/details/details_page.dart';
import '../modules/home/home_page.dart';
import '../bindings/initial_binding.dart';
import 'app_routes.dart';


class AppPages {
  static final pages = [
    GetPage(name: Routes.home, page: () => HomePage(), binding: InitialBinding()),
    GetPage(name: Routes.details, page: () => RepoDetailsPage()),
  ];
}