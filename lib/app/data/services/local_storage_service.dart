// import 'package:hive/hive.dart';
// import 'package:github_flutter_repo_explorer/app/data/models/repo_model.dart';
//
// class LocalStorageService {
//   final Box repoBox = Hive.box('repos');
//   final Box settingsBox = Hive.box('settings');
//
//   void saveRepos(List<RepoModel> repos) {
//     final data = repos.map((e) => e.toJson()).toList();
//     repoBox.put('repo_list', data);
//     print('Hive saved repos: ${data.length}');
//   }
//
//   List<RepoModel> getRepos() {
//     final data = repoBox.get('repo_list');
//     if (data == null) return [];
//     print('Hive loaded repos: ${(data as List).length}');
//     return List<Map<String, dynamic>>.from(data)
//         .map((e) => RepoModel.fromLocal(e))
//         .toList();
//   }
//
//   void saveSortType(String type) {
//     settingsBox.put('sort', type);
//   }
//
//   String getSortType() {
//     return settingsBox.get('sort', defaultValue: 'stars');
//   }
// }
