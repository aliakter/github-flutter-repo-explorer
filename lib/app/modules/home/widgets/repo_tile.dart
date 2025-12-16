// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:github_flutter_repo_explorer/app/data/models/repo_model.dart';
// import 'package:github_flutter_repo_explorer/app/modules/details/details_page.dart';
//
// class RepoTile extends StatelessWidget {
//   final RepoModel repo;
//
//   const RepoTile({super.key, required this.repo});
//
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       leading: CircleAvatar(backgroundImage: NetworkImage(repo.avatar)),
//       title: Text(repo.name),
//       subtitle: Text('${repo.owner} • ⭐ ${repo.stars}'),
//       onTap: () => Get.to(() => DetailsPage(repo: repo)),
//     );
//   }
// }
