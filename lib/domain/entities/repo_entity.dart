class RepoEntity {
  final String name;
  final String owner;
  final String avatar;
  final int stars;
  final String description;
  final DateTime updatedAt;


  RepoEntity({
    required this.name,
    required this.owner,
    required this.avatar,
    required this.stars,
    required this.description,
    required this.updatedAt,
  });
}