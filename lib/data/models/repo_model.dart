import 'package:github_flutter_repo_explorer/domain/entities/repo_entity.dart';

class RepoModel extends RepoEntity {
  RepoModel({
    required super.name,
    required super.owner,
    required super.avatar,
    required super.stars,
    required super.description,
    required super.updatedAt,
  });

  factory RepoModel.fromJson(Map<String, dynamic> json) {
    return RepoModel(
      name: json['name'] ?? '',
      owner: json['owner']['login'] ?? '',
      avatar: json['owner']['avatar_url'] ?? '',
      stars: json['stargazers_count'] ?? 0,
      description: json['description'] ?? '',
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toCache() => {
    'name': name,
    'owner': owner,
    'avatar': avatar,
    'stars': stars,
    'description': description,
    'updatedAt': updatedAt.millisecondsSinceEpoch,
  };

  factory RepoModel.fromCache(Map cache) {
    return RepoModel(
      name: cache['name'],
      owner: cache['owner'],
      avatar: cache['avatar'],
      stars: cache['stars'],
      description: cache['description'],
      updatedAt: DateTime.fromMillisecondsSinceEpoch(
        cache['updatedAt'],
      ),
    );
  }
}
