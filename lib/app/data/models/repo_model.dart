class RepoModel {
  final String name;
  final String owner;
  final String avatar;
  final String description;
  final int stars;
  final DateTime updatedAt;


  RepoModel({
    required this.name,
    required this.owner,
    required this.avatar,
    required this.description,
    required this.stars,
    required this.updatedAt,
  });


  factory RepoModel.fromJson(Map<String, dynamic> json) {
    return RepoModel(
      name: json['name'],
      owner: json['owner']['login'],
      avatar: json['owner']['avatar_url'],
      description: json['description'] ?? '',
      stars: json['stargazers_count'],
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }


  Map<String, dynamic> toJson() => {
    'name': name,
    'owner': owner,
    'avatar': avatar,
    'description': description,
    'stars': stars,
    'updatedAt': updatedAt.toIso8601String(),
  };
}