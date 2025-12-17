import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_flutter_repo_explorer/app/config/flavor_config.dart';
import 'package:github_flutter_repo_explorer/app/pages/app_pages.dart';
import 'package:github_flutter_repo_explorer/app/routes/app_routes.dart';
import 'package:github_flutter_repo_explorer/app/theme/app_theme.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('repos');
  await Hive.openBox('settings');
  FlavorConfig.init(isProd: true);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter GitHub Repos',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: AppRoutes.HOME,
      getPages: AppPages.pages,
    );
  }
}
