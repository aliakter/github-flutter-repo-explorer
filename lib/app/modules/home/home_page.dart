import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter GitHub Repos'),
        actions: [
          IconButton(
            icon: const Icon(Icons.sort),
            onPressed: () {
              controller.sortType.value =
              controller.sortType.value == SortType.stars
                  ? SortType.updated
                  : SortType.stars;
              controller.applySort();
            },
          )
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: controller.repos.length,
          itemBuilder: (_, i) {
            final r = controller.repos[i];
            return ListTile(
              title: Text(r.name),
              subtitle: Text('${r.owner} • ⭐ ${r.stars}'),
              onTap: () => Get.toNamed('/details', arguments: r),
            );
          },
        );
      }),
    );
  }
}