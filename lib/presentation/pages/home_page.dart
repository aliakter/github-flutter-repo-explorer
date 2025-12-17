import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_flutter_repo_explorer/presentation/controllers/repo_controller.dart';
import 'package:github_flutter_repo_explorer/presentation/controllers/theme_controller.dart';
import 'package:github_flutter_repo_explorer/presentation/pages/details_page.dart';

class HomePage extends StatelessWidget {
  final controller = Get.find<RepoController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Repositories'),
        actions: [
          IconButton(icon: Icon(Icons.sort), onPressed: controller.toggleSort),
          IconButton(
            icon: Icon(Icons.dark_mode),
            onPressed: () {
              Get.find<ThemeController>().toggleTheme();
            },
          ),
        ],
      ),
      body: Obx(() {
        if (controller.loading.value) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: controller.repos.length,
          itemBuilder: (_, i) {
            final repo = controller.repos[i];
            return ListTile(
              leading: CircleAvatar(backgroundImage: NetworkImage(repo.avatar)),
              title: Text(repo.name),
              subtitle: Text('⭐ ${repo.stars}'),
              onTap: () => Get.to(() => DetailsPage(repo)),
            );
          },
        );
      }),
    );
  }
}
