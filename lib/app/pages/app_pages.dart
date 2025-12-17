import 'package:get/get.dart';
import 'package:github_flutter_repo_explorer/app/routes/app_routes.dart';
import '../../presentation/pages/home_page.dart';
import '../../presentation/pages/details_page.dart';
import '../bindings/initial_binding.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.HOME,
      page: () => HomePage(),
      binding: InitialBinding(),
    ),
    GetPage(name: AppRoutes.DETAILS, page: () => DetailsPage(Get.arguments)),
  ];
}
