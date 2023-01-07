class Repository {
  final int id;
  final String description;
  final String name;
  final String commitsURL;
  final DateTime createdAt;
  final int forksCount;
  Repository({
    required this.id,
    required this.description,
    required this.name,
    required this.createdAt,
    required this.forksCount,
    required this.commitsURL,
  });

  factory Repository.fromJson(Map<String, dynamic> json) {
    return Repository(
        id: json['id'],
        description: json['description'] ?? "Not Defined",
        name: json['name'],
        createdAt: DateTime.parse(json['created_at']),
        forksCount: json['forks_count'],
        commitsURL: json['commits_url'].split('{')[0]);
  }
}
